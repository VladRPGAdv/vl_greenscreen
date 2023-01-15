# VL_GREENSCREEN
Cu acest script puteti sa faceti poze tuturor vehiculelor voastre intr-un timp relativ scurt.
# Ce trebuie sa fac?
Pentru ca script-ul sa functioneze veti fi nevoiti sa:

 - Sa schimbati la VL.webhook webhook-ul
  - Sa schimbati la VL.VehiclesToScreenshot cu modelele masinilor carora vreti sa le faceti poza.

Pentru a face aceste schimbari trebuie sa intrati in fisierul config.lua
# Cum scot greenscreen-ul?
O data ce ati facut pozele le veti descarca de pe canal-ul cu webhook-ul vostru.

In urmatoarele momente veti avea nevoie de un script in Python  [ NU E FACUT DE MINE (Source code: [https://github.com/kimmobrunfeldt/howto-everything/blob/master/remove-green.md](https://github.com/kimmobrunfeldt/howto-everything/blob/master/remove-green.md "https://github.com/kimmobrunfeldt/howto-everything/blob/master/remove-green.md"))] 
Eu deja v-am facut folder-ul [py]. 

Pentru a putea sa va functioneze script-ul veti avea nevoie sa aveti instalat Python
 https://www.python.org.

Pas cu Pas:
- O data ce sunteti in folder-ul [py] apasati pe directory si scrieti cmd
- O data ce ati scris cmd puteti verifica daca aveti python-ul instalat folosind comanda **python --version**
- Dupa ce ati verificat daca aveti python-ul veti avea nevoie de inca o librarie o puteti instala folosind comanda **pip install Pillow**
- Acum ca avem totul suntem pregatiti sa trecem la magie. Veti fi nevoiti sa trageti imaginile descarcate de pe discord in folder-ul [py]. O data ce le aveti acolo puteti incepe sa scrieti in cmd **python main.py numeleImaginivoastre.extensie** [Exemplu: ***python main.py sanchez.jpg***]
