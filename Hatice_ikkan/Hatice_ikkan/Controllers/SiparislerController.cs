using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Hatice_ikkan.Models;

namespace Hatice_ikkan.Controllers
{
    public class SiparislerController : Controller
    {
        MytTicaretEntities db = new MytTicaretEntities();
        // GET: Siparisler
        public ActionResult Siparis_gec()
        {
            string msj = "";
            if (Session["uyem"] != null)
            {
                int yeni_sipno = (int)(db.Siparisler.Max(x=>x.Siparis_id) + 1);
                var sepetimiz = ((Sepet)Session["sepetimiz"]).Sepetim;
                foreach (var sepetteki_urun in sepetimiz)
                {
                    var siparis_kaydi = new Siparisler
                    {
                        Siparis_id = yeni_sipno,
                        Uye_id = ((Uyeler)Session["uyem"]).Uye_id,
                        Urun_id = sepetteki_urun.urun.Urun_id,
                        Siparis_Adet = sepetteki_urun.Siparis_Adet,
                        Siparis_Tarihi = DateTime.Now
                    };
                    db.Siparisler.Add(siparis_kaydi);
                    db.SaveChanges();
                }
                msj = "Siparişiniz alındı.Sipariş numaranız: " + yeni_sipno;
            }
            else
                msj = "Sipariş vermek için lütfen giriş yapınız...";
            return RedirectToAction("index", "sepet", new { msj });
        }
    }
}