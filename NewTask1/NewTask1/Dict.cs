using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewTask1
{
    public static class Dict
    {
        public static Dictionary<string, string> TabLit = new Dictionary<string, string>
        { ["ай"] = "ay", ["ей"] = "ey", ["ий"] = "iy", ["ой"] = "oy", ["уй"] = "uy",
          ["ый"] = "yy", ["эй"] = "ey", ["юй"] = "yuy", ["ей"] = "yay", ["АЙ"] = "AY",
          ["ЕЙ"] = "EY", ["ИЙ"] = "IY", ["ОЙ"] = "OY", ["УЙ"] = "UY", ["ЫЙ"] = "YY", 
          ["ЭЙ"] = "EY", ["ЮЙ"] = "YUY", ["ЕЙ"] = "YAY", ["а"] = "a", ["б"] = "b", 
          ["в"] = "v", ["г"] = "g", ["д"] = "d", ["е"] = "e", ["ё"] = "e", ["ж"] = "zh", 
          ["з"] = "z", ["и"] = "i", ["й"] = "y", ["к"] = "k", ["л"] = "l", ["м"] = "m", 
          ["н"] = "n", ["о"] = "o", ["п"] = "p", ["р"] = "r", ["с"] = "s", ["т"] = "t", 
          ["у"] = "u", ["ф"] = "f", ["х"] = "kh", ["ц"] = "ts", ["ч"] = "ch", ["ш"] = "sh", 
          ["щ"] = "shch", ["ъ"] = "``", ["ы"] = "y", ["ь"] = "`", ["э"] = "e", ["ю"] = "yu", 
          ["я"] = "ya", ["А"] = "A", ["Б"] = "B", ["В"] = "V", ["Г"] = "G", ["Д"] = "D", 
          ["Е"] = "E", ["Ё"] = "E", ["Ж"] = "ZH", ["З"] = "Z", ["И"] = "I", ["Й"] = "Y", 
          ["К"] = "K", ["Л"] = "L", ["М"] = "M", ["Н"] = "N", ["О"] = "O", ["П"] = "P", 
          ["Р"] = "R", ["С"] = "S", ["Т"] = "T", ["У"] = "U", ["Ф"] = "F", ["Х"] = "Kh",
          ["Ц"] = "TS", ["Ч"] = "CH", ["Ш"] = "SH", ["Щ"] = "SHCH", ["Ъ"] = "``", 
          ["Ы"] = "Y",  ["Ь"] = "`", ["Э"] = "E", ["Ю"] = "YU", ["Я"] = "YA", [" "] = " "
        };
        //*/
        public static string ConvertToEng(string source)
        {
            var result = new StringBuilder();
            foreach (char letter in source)
            {
                result.Append(TabLit[letter.ToString()]);
            }
            return result.ToString();
        }//*/
    }
}
