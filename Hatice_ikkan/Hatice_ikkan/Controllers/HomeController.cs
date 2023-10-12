using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace Hatice_ikkan.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Bilgi()
        {
            return View();
        }

        public ActionResult Hakkimizda()
        {
            return View();
        }

        public ActionResult Iletisim(string subject, string body,string fromEmail, string toEmail = "mytkumas@hotmail.com")
        {
            try
            {
                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential("your_email@gmail.com", "your_password"), // E-posta hesap bilgilerinizi buraya ekleyin
                    EnableSsl = true,
                };

                var mailMessage = new MailMessage
                {
                    From = new MailAddress(fromEmail), // Kullanıcının girdiği e-posta adresi
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true,
                };

                mailMessage.To.Add("mytkumas@hotmail.com"); // Hedef e-posta adresi

                smtpClient.Send(mailMessage);

                ViewBag.Message = "E-posta başarıyla gönderildi.";
            }
            catch (Exception ex)
            {
                ViewBag.Error = "E-posta gönderme hatası: " + ex.Message;
            }
            return View();
        }

        [HttpPost]
        public ActionResult Iletisim(string subject, string body, string fromEmail)
        {
            try
            {
                var fromAddress = new MailAddress("mytkumas@hotmail.com", "Haticeikkan");
                var toAddress = new MailAddress("mytkumas@hotmail.com", fromEmail);
                string fromPassword = ""; // E-posta hesabınızın şifresi //Buraya e-posta hangi mail adresine gidecekse o hesabın şifresi yazılmalı.

                var smtpClient = new SmtpClient
                {
                    Host = "smtp-mail.outlook.com", // E-posta sağlayıcınızın SMTP sunucusu
                    Port = 587, // SMTP sunucu bağlantı noktası
                    EnableSsl = true, // Güvenli bağlantı (SSL/TLS) kullanılsın mı?
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };

                var mailMessage = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                };

                smtpClient.Send(mailMessage);

                ViewBag.Message = "E-posta başarıyla gönderildi.";
            }
            catch (Exception ex)
            {
                ViewBag.Error = "E-posta gönderme hatası: " + ex.Message;
            }

            return View();
        }
    }
}