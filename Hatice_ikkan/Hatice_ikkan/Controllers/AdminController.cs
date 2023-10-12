using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Data.Entity;
using System.Web;
using System.Web.Mvc;
using Hatice_ikkan.Models;
using System.IO;

namespace Hatice_ikkan.Controllers
{
    public class AdminController : Controller
    {
        private MytTicaretEntities db = new MytTicaretEntities();

        // GİRİŞ//
        public ActionResult Giris()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Giris(string kadi, string sifre)
        {
            Session["admin"] = db.Yoneticiler.ToList().Find(x => x.Y_Kullanici_Adi == kadi && x.Y_Sifre == sifre);
            if (Session["admin"] != null)
            {
                ViewBag.ekle = "Hoşgeldiniz";
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.ekle = "Hatalı Giriş Tekrar Dene";
                return View();
            }
        }

        public ActionResult guv_cik()
        {
            Session.RemoveAll();
            Session.Abandon();
            return RedirectToAction("Giris");
        }





        // ADMİN KISMI //
        public ActionResult Index()
        {
            if (Session["admin"] != null)
            {
                var adminler = db.Yoneticiler.ToList();
                return View(adminler);
            }
            else
            {
                return View("Error");
            }
        }

        public ActionResult AdminDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Yoneticiler yoneticiler = db.Yoneticiler.Find(id);
            if (yoneticiler == null)
            {
                return HttpNotFound();
            }
            return View(yoneticiler);
        }

        public ActionResult AdminCreate()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AdminCreate([Bind(Include = "Yonetici_id,Y_Kullanici_Adi,Y_Sifre")] Yoneticiler yoneticiler)
        {
            if (ModelState.IsValid)
            {
                db.Yoneticiler.Add(yoneticiler);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(yoneticiler);
        }

        public ActionResult AdminEdit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Yoneticiler yoneticiler = db.Yoneticiler.Find(id);
            if (yoneticiler == null)
            {
                return HttpNotFound();
            }
            return View(yoneticiler);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AdminEdit([Bind(Include = "Yonetici_id,Y_Kullanici_Adi,Y_Sifre")] Yoneticiler yoneticiler)
        {
            if (ModelState.IsValid)
            {
                db.Entry(yoneticiler).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(yoneticiler);
        }
                
        public ActionResult AdminDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Yoneticiler yoneticiler = db.Yoneticiler.Find(id);
            if (yoneticiler == null)
            {
                return HttpNotFound();
            }
            return View(yoneticiler);
        }

        [HttpPost, ActionName("AdminDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult AdminDeleteConfirmed(int id)
        {
            Yoneticiler yoneticiler = db.Yoneticiler.Find(id);
            db.Yoneticiler.Remove(yoneticiler);
            db.SaveChanges();
            return RedirectToAction("Index");
        }





        // BLOG KISMI //
        public ActionResult BlogIndex()
        {
            if (Session["admin"] != null)
            {
                var blog = db.Blog.Include(b => b.Uyeler).Include(b => b.Yoneticiler);
                return View(blog.ToList());
            }
            else
            {
                return View("Error");
            }
        }

        public ActionResult BlogDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blog.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        public ActionResult BlogCreate()
        {
            ViewBag.Uye_id = new SelectList(db.Uyeler, "Uye_id", "Adi_Soyadi");
            ViewBag.Yonetici_id = new SelectList(db.Yoneticiler, "Yonetici_id", "Y_Kullanici_Adi");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult BlogCreate(Blog blog,HttpPostedFileBase blogresim )
        {
            if (ModelState.IsValid)
            {
                string Blog_Resmi= Path.GetFileName(blogresim.FileName);
                string tam_yol = Server.MapPath("~/blog_resimleri") + Blog_Resmi;
                blogresim.SaveAs(tam_yol);
                blog.Blog_Resmi = Blog_Resmi;

                db.Blog.Add(blog);
                db.SaveChanges();
                return RedirectToAction("BlogIndex");
            }

            ViewBag.Uye_id = new SelectList(db.Uyeler, "Uye_id", "Adi_Soyadi", blog.Uye_id);
            ViewBag.Yonetici_id = new SelectList(db.Yoneticiler, "Yonetici_id", "Y_Kullanici_Adi", blog.Yonetici_id);
            return View(blog);
        }

        public ActionResult BlogEdit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blog.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            ViewBag.Uye_id = new SelectList(db.Uyeler, "Uye_id", "Adi_Soyadi", blog.Uye_id);
            ViewBag.Yonetici_id = new SelectList(db.Yoneticiler, "Yonetici_id", "Y_Kullanici_Adi", blog.Yonetici_id);
            return View(blog);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult BlogEdit([Bind(Include = "Blog_id,Blog_Baslık,Blog_Ozet,Blog_Acıklama,Blog_Resmi,Yonetici_id,Uye_id")] Blog blog, HttpPostedFileBase blogresim)
        {
            if (ModelState.IsValid)
            {
                string Blog_Resmi = Path.GetFileName(blogresim.FileName);
                string tam_yol = Server.MapPath("~/blog_resimleri") + Blog_Resmi;
                blogresim.SaveAs(tam_yol);
                blog.Blog_Resmi = Blog_Resmi;

                db.Entry(blog).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("BlogIndex");
            }
            ViewBag.Uye_id = new SelectList(db.Uyeler, "Uye_id", "Adi_Soyadi", blog.Uye_id);
            ViewBag.Yonetici_id = new SelectList(db.Yoneticiler, "Yonetici_id", "Y_Kullanici_Adi", blog.Yonetici_id);
            return View(blog);
        }

        public ActionResult BlogDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blog.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        [HttpPost, ActionName("BlogDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult BlogDeleteConfirmed(int id)
        {
            Blog blog = db.Blog.Find(id);
            db.Blog.Remove(blog);
            db.SaveChanges();
            return RedirectToAction("BlogIndex");
        }





        //UYELER KISMI//
        public ActionResult UyelerIndex()
        {
            if (Session["admin"] != null)
            {
                return View(db.Uyeler.ToList());
            }
            else
            {
                return View("Error");
            }
            
        }

        public ActionResult UyelerDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Uyeler uyeler = db.Uyeler.Find(id);
            if (uyeler == null)
            {
                return HttpNotFound();
            }
            return View(uyeler);
        }

        public ActionResult UyelerCreate()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UyelerCreate([Bind(Include = "Uye_id,Adi_Soyadi,Cinsiyet,Dogum_Tarihi,Adres,Telefon,Mail,Kullanici_Adi,Sifre")] Uyeler uyeler)
        {
            if (ModelState.IsValid)
            {
                db.Uyeler.Add(uyeler);
                db.SaveChanges();
                return RedirectToAction("UyelerIndex");
            }

            return View(uyeler);
        }

        public ActionResult UyelerEdit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Uyeler uyeler = db.Uyeler.Find(id);
            if (uyeler == null)
            {
                return HttpNotFound();
            }
            return View(uyeler);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UyelerEdit([Bind(Include = "Uye_id,Adi_Soyadi,Cinsiyet,Dogum_Tarihi,Adres,Telefon,Mail,Kullanici_Adi,Sifre")] Uyeler uyeler)
        {
            if (ModelState.IsValid)
            {
                db.Entry(uyeler).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("UyelerIndex");
            }
            return View(uyeler);
        }

        public ActionResult UyelerDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Uyeler uyeler = db.Uyeler.Find(id);
            if (uyeler == null)
            {
                return HttpNotFound();
            }
            return View(uyeler);
        }

        [HttpPost, ActionName("UyelerDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult UyelerDeleteConfirmed(int id)
        {
            Uyeler uyeler = db.Uyeler.Find(id);
            db.Uyeler.Remove(uyeler);
            db.SaveChanges();
            return RedirectToAction("UyelerIndex");
        }





        // ÜRÜNLER KISMI //
        public ActionResult UrunlerIndex()
        {
            if (Session["admin"] != null)
            {
               var urunler = db.Urunler.Include(u => u.Kategoriler);
            return View(urunler.ToList());
            }
            else
            {
                return View("Error");
            }
            
        }

        public ActionResult UrunlerDetails(int? id)
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

        public ActionResult UrunlerCreate()
        {
            ViewBag.Kategori_id = new SelectList(db.Kategoriler, "Kategori_id", "Kategori_Adi");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UrunlerCreate([Bind(Include = "Urun_id,Urun_Adi,Urun_Fiyat,Urun_Aciklama,Urun_Resmi,Kategori_id")] Urunler urunler , HttpPostedFileBase urunresim)
        {
            if (ModelState.IsValid)
            {
                string Urun_Resmi = Path.GetFileName(urunresim.FileName);
                string tam_yol = Server.MapPath("~/urun_resimleri") + Urun_Resmi;
                urunresim.SaveAs(tam_yol);
                urunler.Urun_Resmi = Urun_Resmi;

                db.Urunler.Add(urunler);
                db.SaveChanges();
                return RedirectToAction("UrunlerIndex");
            }

            ViewBag.Kategori_id = new SelectList(db.Kategoriler, "Kategori_id", "Kategori_Adi", urunler.Kategori_id);
            return View(urunler);
        }

        public ActionResult UrunlerEdit(int? id)
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
            ViewBag.Kategori_id = new SelectList(db.Kategoriler, "Kategori_id", "Kategori_Adi", urunler.Kategori_id);
            return View(urunler);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UrunlerEdit([Bind(Include = "Urun_id,Urun_Adi,Urun_Fiyat,Urun_Aciklama,Urun_Resmi,Kategori_id")] Urunler urunler, HttpPostedFileBase urunresim)
        {
            if (ModelState.IsValid)
            {
                string Urun_Resmi = Path.GetFileName(urunresim.FileName);
                string tam_yol = Server.MapPath("~/urun_resimleri") + Urun_Resmi;
                urunresim.SaveAs(tam_yol);
                urunler.Urun_Resmi = Urun_Resmi;

                db.Entry(urunler).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("UrunlerIndex");
            }
            ViewBag.Kategori_id = new SelectList(db.Kategoriler, "Kategori_id", "Kategori_Adi", urunler.Kategori_id);
            return View(urunler);
        }

        public ActionResult UrunlerDelete(int? id)
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

        [HttpPost, ActionName("UrunlerDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult UrunlerDeleteConfirmed(int id)
        {
            Urunler urunler = db.Urunler.Find(id);
            db.Urunler.Remove(urunler);
            db.SaveChanges();
            return RedirectToAction("UrunlerIndex");
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