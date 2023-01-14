using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace FinalSis457Mgv.Models
{
    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Usuario")]

        public string usuario { get; set; }

        [Required]
        [Display(Name = "Contraseña")]
        [DataType(DataType.Password)]

        public string clave { get; set; }

        [Required]
        [Display(Name = "Recordarme")]

        public bool recordarme { get; set; }
    }
}