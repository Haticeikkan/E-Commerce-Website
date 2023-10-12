using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Hatice_ikkan.Models;

namespace Hatice_ikkan.Controllers
{
    public class UrunlerController : Controller
    {
        private MytTicaretEntities db = new MytTicaretEntities();

        // GET: Urunler
        public ActionResult Index(double? min, double? max, string searchText)
        {
            List<Urunler> urun_listesi;
            if (searchText != null) urun_listesi = db.Urunler.Where(x => x.Urun_Adi.Contains(searchText)).ToList();
            else if (min != null && max != null) urun_listesi = db.Urunler.Where(x => x.Urun_Fiyat >= min && x.Urun_Fiyat <= max).ToList();
            else urun_listesi = db.Urunler.ToList();
            return View(urun_listesi);
        }

        // GET: Urunler/Details/
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Urunler urunler = db.Urunler.Find(id);
            if (urunler == null)
            {
                return HttpNotFound();
            }
            return View(urunler);
        }


        public ActionResult pamuklu(double? min, double? max,string searchText)
        {
            List<Urunler> urun_listesi;
            if (searchText != null) urun_listesi = db.Urunler.Where(x => x.Urun_Adi.Contains(searchText)).ToList();
            else if (min != null && max != null) urun_listesi = db.Urunler.Where(x => x.Urun_Fiyat >= min && x.Urun_Fiyat <= max).ToList();
            else urun_listesi = db.Urunler.Where(x => x.Kategori_id == 1).ToList();
            return View(urun_listesi);
        }

        public ActionResult kislik(double? min, double? max, string searchText)
        {
            List<Urunler> urun_listesi;
            if (searchText != null) urun_listesi = db.Urunler.Where(x => x.Urun_Adi.Contains(searchText)).ToList();
            else if (min != null && max != null) urun_listesi = db.Urunler.Where(x => x.Urun_Fiyat >= min && x.Urun_Fiyat <= max).ToList();
            else urun_listesi = db.Urunler.Where(x=>x.Kategori_id==2).ToList();
            return View(urun_listesi);
        }

        public ActionResult kot(double? min, double? max, string searchText)
        {
            List<Urunler> urun_listesi;
            if (searchText != null) urun_listesi = db.Urunler.Where(x => x.Urun_Adi.Contains(searchText)).ToList();
            else if (min != null && max != null) urun_listesi = db.Urunler.Where(x => x.Urun_Fiyat >= min && x.Urun_Fiyat <= max).ToList();
            else urun_listesi = db.Urunler.Where(x => x.Kategori_id == 3).ToList();
            return View(urun_listesi);
        }

        public ActionResult krep(double? min, double? max, string searchText)
        {
            List<Urunler> urun_listesi;
            if (searchText != null) urun_listesi = db.Urunler.Where(x => x.Urun_Adi.Contains(searchText)).ToList();
            else if (min != null && max != null) urun_listesi = db.Urunler.Where(x => x.Urun_Fiyat >= min && x.Urun_Fiyat <= max).ToList();
            else urun_listesi = db.Urunler.Where(x => x.Kategori_id == 4).ToList();
            return View(urun_listesi);
        }

        public ActionResult muhtelif(double? min, double? max, string searchText)
        {
            List<Urunler> urun_listesi;
            if (searchText != null) urun_listesi = db.Urunler.Where(x => x.Urun_Adi.Contains(searchText)).ToList();
            else if (min != null && max != null) urun_listesi = db.Urunler.Where(x => x.Urun_Fiyat >= min && x.Urun_Fiyat <= max).ToList();
            else urun_listesi = db.Urunler.Where(x => x.Kategori_id == 5).ToList();
            return View(urun_listesi);
        }
        
        
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
