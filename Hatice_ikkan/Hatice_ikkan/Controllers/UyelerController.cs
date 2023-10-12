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
    public class UyelerController : Controller
    {
        private MytTicaretEntities db = new MytTicaretEntities();

        public ActionResult UyeGiris()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UyeGiris(string kadi, string sifre)
        {
            Session["uyem"] = db.Uyeler.ToList().Find(x => x.Kullanici_Adi == kadi && x.Sifre == sifre);
            if (Session["uyem"] != null)
            {
                ViewBag.ekle = "Hoşgeldiniz";
                return RedirectToAction("Index","Home");
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
            return RedirectToAction("UyeGiris");
        }


        // GET: Uyeler
        public ActionResult Index()
        {
            var x = Session["uyem"];
            //Session["uyem"] = "x";
            if (Session["uyem"] != null)
            {
                return RedirectToAction("Index","Home");
            }
            else return HttpNotFound();
            
        }

        public ActionResult Create()
        {
            return View();
        }

      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Uye_id,Adi_Soyadi,Cinsiyet,Dogum_Tarihi,Adres,Telefon,Mail,Kullanici_Adi,Sifre")] Uyeler uyeler)
        {
            if (ModelState.IsValid)
            {
                db.Uyeler.Add(uyeler);
                db.SaveChanges();
                return RedirectToAction("UyeGiris");
            }

            return View(uyeler);
        }

      
        public ActionResult Edit(int? id)
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
        public ActionResult Edit([Bind(Include = "Uye_id,Adi_Soyadi,Cinsiyet,Dogum_Tarihi,Adres,Telefon,Mail,Kullanici_Adi,Sifre")] Uyeler uyeler)
        {
            if (ModelState.IsValid)
            {
                db.Entry(uyeler).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index","Uyeler");
            }
            return View(uyeler);
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
