using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hatice_ikkan.Models
{
    public class Sepet
    {
        private List<Sepetlik> _sepetim = new List<Sepetlik>();
        public List<Sepetlik> Sepetim { get => _sepetim; }

        public void Sepete_ekle(Urunler gelen_urun,byte Siparis_Adet)
        {
            var varolan_urun = _sepetim.FirstOrDefault(x => x.urun.Urun_id == gelen_urun.Urun_id);
            if (varolan_urun == null)
            {
                _sepetim.Add(new Sepetlik { urun = gelen_urun, Siparis_Adet = 1 });
            }
            else if (Siparis_Adet == 0) varolan_urun.Siparis_Adet += 1;
            else varolan_urun.Siparis_Adet = Siparis_Adet;
        }

        public void sepetten_sil(Urunler silinecek_urun)
        {
            _sepetim.RemoveAll(x => x.urun.Urun_id == silinecek_urun.Urun_id);
        }

        public double sepet_toplami()
        {
            return _sepetim.Sum(x => x.urun.Urun_Fiyat * x.Siparis_Adet);
        }
        public void sepeti_temizle()
        {
            _sepetim.Clear();
        }
    }
}