using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace NewTask2
{
    enum RowState
    { 
        Existed,
        New,
        Modified,
        ModifiedNew,
        Deleted
    }

    public partial class Form1 : Form
    {
        DataBase dataBase = new DataBase();

        int selectedRow;

        public Form1()
        {
            InitializeComponent();            
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("s.discipline_id", "id");
            dataGridView1.Columns.Add("mdate", "Дата");
            dataGridView1.Columns.Add("course", "Курс");
            dataGridView1.Columns.Add("number", "Группа");
            dataGridView1.Columns.Add("lesson_numb", "№ пары");
            dataGridView1.Columns.Add("less_type", "Предмет");
            //dataGridView1.Columns.Add("beg_time", "Начало занятия");
            //dataGridView1.Columns.Add("end_time", "Конец занятия");
            dataGridView1.Columns.Add("IsNew", String.Empty);
            dataGridView1.Columns[6].Visible = false;

            dataGridView1.Columns[0].Width = 40;
            dataGridView1.Columns[1].Width = 107;
            dataGridView1.Columns[2].Width = 60;
            dataGridView1.Columns[3].Width = 80;
            dataGridView1.Columns[4].Width = 60;
            dataGridView1.Columns[5].Width = 230;
        }

        private void ReadSingleRow(DataGridView dgv, IDataRecord record)
        {
            dgv.Rows.Add(record.GetInt32(0), record.GetDateTime(1), record.GetInt32(2), record.GetInt32(3), record.GetInt32(4), record.GetString(5), /*record.GetDateTime(5), record.GetDateTime(6),*/ RowState.ModifiedNew);
        }
               
        private void RefreshDataGrid(DataGridView dgv)
        {
            dgv.Rows.Clear();

            string queryString = $"SELECT s.discipline_id, s.mdate, G.course, G.number,  L.lesson_numb, le.less_type, L.beg_time, L.end_time FROM Schedule_db s JOIN Groups G on s.group_id = G.group_id JOIN   Less_time L on s.lesson_numb = L.lesson_numb JOIN     lessons le on s.less_id = le.less_id";
                                                                                                                    //INTO #TestTable                                                                                                                                                     //; SELECT * FROM #TestTable 
            SqlCommand command = new SqlCommand(queryString, dataBase.GetConnection());

            dataBase.openConnection();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgv, reader);
            }
            reader.Close();
        }

        private void Form1_Load(object sender, EventArgs e)
        {            
           // panel1.Visible = false;

            //cbDateSelect.SelectedIndex = 0;
            //cbCourseSelect.SelectedIndex = 0;
            label7.Visible = false;
            lbl_id.Visible = false;            

            /*
            this.dataGridView1.Location = new Point(this.dataGridView1.Location.X, 12);
            this.dataGridView1.Location = new Point(this.dataGridView1.Location.Y, 296);
            this.dataGridView1.Size = new Size(this.dataGridView1.Size.Width, 976);
            this.dataGridView1.Size = new Size(this.dataGridView1.Size.Height, 545);
            */
            CreateColumns();
            RefreshDataGrid(dataGridView1);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            selectedRow = e.RowIndex;

            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dataGridView1.Rows[selectedRow];
                lbl_id.Text = row.Cells[0].Value.ToString();
                tbDate.Text = row.Cells[1].Value.ToString();
                tbCourse.Text = row.Cells[2].Value.ToString();
                tbGroupe.Text = row.Cells[3].Value.ToString();
                tbPara.Text = row.Cells[4].Value.ToString();
                tbLesson.Text = row.Cells[5].Value.ToString();
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            RefreshDataGrid(dataGridView1);
            ClearFields();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            dataBase.openConnection();
            string date = tbDate.Text;
            int course;
            int group;
            int para; 
            var lesson = tbLesson.Text;

            if ((int.TryParse(tbCourse.Text, out course)) && (int.TryParse(tbGroupe.Text, out group)) && (int.TryParse(tbPara.Text, out para)) && (para <= 6))
            {
                var addQuery = $"insert into lessons (less_type) values ('{lesson}') insert into Groups(faculty, course, number) values(8,'{course}','{group}') insert into Schedule_db(mdate, lesson_numb, less_id, group_id) values('{date}', '{para}', (select MAX(le.less_id) FROM lessons le WHERE le.less_type = '{lesson}'), (select MAX(G.group_id) FROM Groups G WHERE G.number = '{group}') )";

                var command = new SqlCommand(addQuery, dataBase.GetConnection());
                command.ExecuteNonQuery();

                MessageBox.Show("Запись создана!", "Работает!", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Некорректная запись!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }

            dataBase.closeConnection();
            RefreshDataGrid(dataGridView1);
        }

        private void tbDate_KeyPress(object sender, KeyPressEventArgs e)
        {
            char L = e.KeyChar;
            if ((L < '0' || L > '9') && L != '\b' && L != '.')// && L != '.' && L != ' ' && L != ':')
            {
                e.Handled = true;
            }
        }


        private void Search(DataGridView dgv)
        {
            dgv.Rows.Clear();

            // SELECT s.discipline_id, s.mdate, G.course, G.number,  L.lesson_numb, le.less_type, L.beg_time, L.end_time FROM Schedule_db s JOIN Groups G on s.group_id = G.group_id JOIN   Less_time L on s.lesson_numb = L.lesson_numb JOIN     lessons le on s.less_id = le.less_id
                        
            string searchString = $"select * from (SELECT s.discipline_id, s.mdate, G.course, G.number,  L.lesson_numb, le.less_type, L.beg_time, L.end_time FROM Schedule_db s JOIN Groups G on s.group_id = G.group_id JOIN Less_time L on s.lesson_numb = L.lesson_numb JOIN lessons le on s.less_id = le.less_id) AS TAB where concat(TAB.discipline_id, TAB.mdate, TAB.course, TAB.number, TAB.lesson_numb, TAB.less_type, TAB.beg_time, TAB.end_time ) like '%" + tbSearch.Text + "%'";
            SqlCommand com = new SqlCommand(searchString, dataBase.GetConnection());

            dataBase.openConnection();
            SqlDataReader read = com.ExecuteReader();

            while (read.Read())
            {
                ReadSingleRow(dgv, read);
            }
            read.Close();
        }

        private void tbSearch_TextChanged(object sender, EventArgs e)
        {
            Search(dataGridView1);
        }

        private void tbSearch_Click(object sender, EventArgs e)
        {
            tbSearch.Text = string.Empty;
            tbSearch.ForeColor = System.Drawing.Color.Black;
        }

        private void deleteRow()
        {
            int index = dataGridView1.CurrentCell.RowIndex;

            dataGridView1.Rows[index].Visible = false;

            if (dataGridView1.Rows[index].Cells[0].Value.ToString() == string.Empty)
            {
                dataGridView1.Rows[index].Cells[6].Value = RowState.Deleted;
                return;
            }

            dataGridView1.Rows[index].Cells[6].Value = RowState.Deleted;
        }

        private void newUpdate()
        {
            dataBase.openConnection();

            for (int index = 0; index < dataGridView1.Rows.Count; index++)
            {
                var rowState = (RowState)dataGridView1.Rows[index].Cells[6].Value;

                if (rowState == RowState.Existed)
                    continue;
                if (rowState == RowState.Deleted)
                {
                    var id = Convert.ToInt32(dataGridView1.Rows[index].Cells[0].Value);
                    //var deleteQuery = $"DELETE FROM lessons WHERE less_id = (select less_id from Schedule_db where discipline_id = '{id}')";
                    var deleteQuery = $"SELECT group_id into #temp from Schedule_db where discipline_id = '{id}' DELETE FROM lessons WHERE less_id = (select less_id from Schedule_db where discipline_id = '{id}') DELETE FROM Groups WHERE group_id = (select group_id from #temp)";


                    var command = new SqlCommand(deleteQuery, dataBase.GetConnection());
                    command.ExecuteNonQuery();
                }


                if (rowState == RowState.Modified)
                {
                    var id = dataGridView1.Rows[index].Cells[0].Value.ToString();
                    var date = dataGridView1.Rows[index].Cells[1].Value.ToString();
                    var course = dataGridView1.Rows[index].Cells[2].Value.ToString();
                    var group = dataGridView1.Rows[index].Cells[3].Value.ToString();
                    var para = dataGridView1.Rows[index].Cells[4].Value.ToString();
                    var lesson = dataGridView1.Rows[index].Cells[5].Value.ToString();

                    var changeQuery = $"update lessons set lessons.less_type = '{lesson}' where lessons.less_id = (select Schedule_db.less_id from Schedule_db where Schedule_db.discipline_id = '{id}') update Groups set course = '{course}', Groups.number = '{group}' where Groups.group_id = (select Schedule_db.group_id from Schedule_db where Schedule_db.discipline_id = '{id}') update Schedule_db set Schedule_db.mdate = '{date}', Schedule_db.lesson_numb = '{para}', Schedule_db.less_id = (select MAX(le.less_id) FROM lessons le WHERE le.less_type = '{lesson}'), Schedule_db.group_id = (select MAX(G.group_id) FROM Groups G WHERE G.number = '{group}') where Schedule_db.discipline_id = '{id}'";

                    var command = new SqlCommand(changeQuery, dataBase.GetConnection());
                    command.ExecuteNonQuery();
                }
            }
            dataBase.closeConnection();

            //RefreshDataGrid(dataGridView1);
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            deleteRow();
            ClearFields();

            btnSave.BackColor = System.Drawing.Color.PaleGreen;
            btnNew.Enabled = false;
            btnDelete.Enabled = false;
            btnChange.Enabled = false;
            
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            newUpdate();
            MessageBox.Show("Данные сохранены!", "Работает!", MessageBoxButtons.OK, MessageBoxIcon.Information);            
            btnSave.BackColor = Color.FromArgb(255, 25, 118, 210);
            btnNew.Enabled = true;
            btnDelete.Enabled = true;
            btnChange.Enabled = true;
        }

        private void Change()
        {
            var selectedRowIndex = dataGridView1.CurrentCell.RowIndex;

            var id = lbl_id.Text;
            string date = tbDate.Text;
            int course;
            int group;
            int para;
            var lesson = tbLesson.Text;

            if (dataGridView1.Rows[selectedRowIndex].Cells[0].Value.ToString() != string.Empty)
            {
                if ((int.TryParse(tbCourse.Text, out course)) && (int.TryParse(tbGroupe.Text, out group)) && (int.TryParse(tbPara.Text, out para))&& (para <= 6))
                {
                    dataGridView1.Rows[selectedRowIndex].SetValues(id, date, course, group, para, lesson);
                    dataGridView1.Rows[selectedRowIndex].Cells[6].Value = RowState.Modified;
                }
                else
                {
                    MessageBox.Show("Некорректная запись!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }            

        }

        private void btnChange_Click(object sender, EventArgs e)
        {
            Change();
            ClearFields();

            btnSave.BackColor = System.Drawing.Color.PaleGreen;
            btnNew.Enabled = false;
            btnDelete.Enabled = false;
            btnChange.Enabled = false;
        }

        private void ClearFields() 
        {
            lbl_id.Text = "";
            tbDate.Text = "";
            tbCourse.Text = "";
            tbGroupe.Text = "";
            tbPara.Text = "";
            tbLesson.Text = "";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Хотите выйти?", "Подтвердите", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Close();
            }
        }
    }
}
