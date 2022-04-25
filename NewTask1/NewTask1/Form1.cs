using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Xml.Serialization;

namespace NewTask1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();            
        }

        public void ClearInput()
        {
            textBox1.Text = string.Empty;            
        }

        public string DefaultText = "Введите тект на русском языке";

        private void textBox1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == DefaultText)
            {
                textBox1.Text = string.Empty;
                textBox1.ForeColor = System.Drawing.Color.Black;
            }
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            char L = e.KeyChar;
            if ((L < 'А' || L > 'я') && L != '\b' && L != '.' && L != ' ' && L != 'ё' && L != 'Ё')
            {
                e.Handled = true;
            }
            CheckEnterKeyPress(sender, e);
        }

        private void CheckEnterKeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                button1_Click(button1, null);
                ClearInput();
            }
        }   
        
        private void Form1_Load(object sender, EventArgs e)
        {
            textBox1.Text = DefaultText;
            textBox1.ForeColor = System.Drawing.Color.Gray;
            //*/
            Table table = DeserializeXML();

            foreach (WString wString in table.WStringList)
            {
                Add(wString);
            }
            //*/ 
        }

        private void SerializeXML(Table table)
        {
            XmlSerializer xml = new XmlSerializer(typeof(Table));

            using (FileStream fs = new FileStream("Translit_Table.xml", FileMode.OpenOrCreate))
            {
                xml.Serialize(fs, table);
            }
        }

        private Table DeserializeXML()
        {
            XmlSerializer xml = new XmlSerializer(typeof(Table));

            using (FileStream fs = new FileStream("Translit_Table.xml", FileMode.OpenOrCreate))
            {
                return (Table)xml.Deserialize(fs);
            }
        }

        private void Add(WString wString)
        {
            ListViewItem LVI = new ListViewItem(new string[] { wString.RusStirng, wString.EngStirng });
            LVI.Tag = wString;

            listView1.Items.Add(LVI);
        }

        private void button1_Click(object sender, EventArgs e)
        {         
            if ((textBox1.Text != string.Empty) && (textBox1.Text != DefaultText) && (textBox1.Text != " "))
            {           
                string inputText = textBox1.Text;
                string translatedText = Dict.ConvertToEng(inputText);

                WString wString = new WString(inputText, translatedText);

                ListViewItem listViewItem = new ListViewItem(new string[] { wString.RusStirng, wString.EngStirng });
                listViewItem.Tag = wString;
                listView1.Items.Add(listViewItem);                

                ClearInput();
            }            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Table table = new Table();

            foreach (ListViewItem item in listView1.Items)
            {
                if (item.Tag != null)
                {
                    table.WStringList.Add((WString)item.Tag);
                }
            }

            SerializeXML(table);       
        }
    }
}
