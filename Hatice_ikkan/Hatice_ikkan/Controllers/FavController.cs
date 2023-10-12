using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Hatice_ikkan.Models;

namespace Hatice_ikkan.Controllers
{
    public class FavController : Controller
    {
        MytTicaretEntities db = new MytTicaretEntities();
        public Fav fav_getir()
        {
            var favkap = (Fav)Session["favkap"];
            if (favkap == null)
            {
                favkap = new Fav();
                Session["favkap"] = favkap;
            }
            return favkap;
        }

        public ActionResult Index()
        {
            return View(fav_getir());
        }

        public ActionResult fav_ekle(int? Urun_id, byte? adet)
        {
            var _adet = adet ?? 0;
            var urun = db.Urunler.FirstOrDefault(x => x.Urun_id == Urun_id);
            if (urun != null)
            {
                fav_getir().fav_ekle(urun,_adet);
            }
            else
                return HttpNotFound();
            return RedirectToAction("Index");
        }

        public ActionResult favdan_sil(int urunid)
        {
            var silinecek_urun = db.Urunler.FirstOrDefault(x => x.Urun_id == urunid);
            fav_getir().favdan_sil(silinecek_urun);
            return RedirectToAction("Index");
        }
        public ActionResult fav_temizle()
        {
            fav_getir().fav_temizle();
            return RedirectToAction("Index");
        }

    }
}