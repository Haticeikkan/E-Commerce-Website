using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hatice_ikkan.Models
{
    public class Fav
    {
        private List<FavKap> _favkap = new List<FavKap>();
        public List<FavKap> Favkap { get => _favkap; }

        public void fav_ekle(Urunler yeni_fav, byte adet)
        {
            var varolan_fav = _favkap.FirstOrDefault(x => x.urun.Urun_id == yeni_fav.Urun_id);
            if (varolan_fav == null)
            {
                _favkap.Add(new FavKap
                {
                    urun = yeni_fav,
                    adet = 1
                });
            }//if bitişi
            else if (adet == 0) varolan_fav.adet += 1;
            else varolan_fav.adet = adet;
        }//fav ekle bitişi

        public void favdan_sil(Urunler silinecek_fav)
        {
            _favkap.RemoveAll(x => x.urun.Urun_id == silinecek_fav.Urun_id);
        }

        public void fav_temizle()
        {
            _favkap.Clear();
        }
        public class FavKap
        {
            public Urunler urun { get; set; }
            public byte adet { get; set; }
        }
    }
}