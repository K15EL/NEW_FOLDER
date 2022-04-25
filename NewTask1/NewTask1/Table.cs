using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewTask1
{
    [Serializable]
    public class Table
    {
        public List<WString> WStringList { get; set; } = new List<WString>();
    }

    [Serializable]
    public class WString
    {
        public string RusStirng { get; set; }
        public string EngStirng { get; set; }

        public WString() { }

        public WString(string RusStirng, string EngStirng)
        { 
            this.RusStirng = RusStirng;
            this.EngStirng = EngStirng;
        }

    }

}
