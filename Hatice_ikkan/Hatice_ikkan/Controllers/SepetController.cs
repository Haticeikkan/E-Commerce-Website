using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Hatice_ikkan.Models;

namespace Hatice_ikkan.Controllers
{
    public class SepetController : Controller
    {
        MytTicaretEntities db = new MytTicaretEntities();
        public Sepet Sepeti_getir()
        {
            var sepetimiz = (Sepet)Session["sepetimiz"];
            if (sepetimiz == null)
            {
                sepetimiz = new Sepet();
                Session["sepetimiz"] = sepetimiz;
            }
            return sepetimiz;
        }

        public ActionResult Index(string msj)
        {
            ViewBag.msj = msj;
            return View(Sepeti_getir());
        }

        public ActionResult sepete_ekle(int? Urun_id,byte? Siparis_Adet)
        {
            var _adet = Siparis_Adet ?? 0;
            var urun = db.Urunler.FirstOrDefault(x => x.Urun_id == Urun_id);
            if (urun != null)
            {
                Sepeti_getir().Sepete_ekle(urun, _adet);
            }
            else
                return HttpNotFound();
            return RedirectToAction("Index");
        }

        public ActionResult sepetten_sil(int urunid)
        {
            var silinecek_urun = db.Urunler.FirstOrDefault(x => x.Urun_id == urunid);
            Sepeti_getir().sepetten_sil(silinecek_urun);
            return RedirectToAction("Index");
        }
        public ActionResult sepeti_temizle()
        {
            Sepeti_getir().sepeti_temizle();
            return RedirectToAction("Index");
        }
      
    }
}