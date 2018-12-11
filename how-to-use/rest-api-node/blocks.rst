Blocks
========

GET /blocks/height
~~~~~~~~~~~~~~~~~~

Возвращает высоту (номер блока) текущего состояния блокчейна.

**Ответ метода:**

.. code:: js

   {   
     "height": 7788    
   }    

GET /blocks/last
~~~~~~~~~~~~~~~~

Возвращает содержимое последнего блока.

**Ответ метода:**

.. code:: js

   {   
     "version": 2,   
     "timestamp": 1479313809528,       
     "reference": "4MLXQDbARiJDEAoy5vZ8QYh1yNnDhdGhGWkDKna8J6QXb7agVpFEi16hHBGUxxnq8x4myG4w66DR4Ze8FM5dh8Gi",        
     "nxtconsensus": {       
       "basetarget": 464,        
       "generationsignature": "7WUV2TufaRAyjiCPFdnAWbn2Q7Jk7nBmWbnnDXKDEeJv"       
     },        
     "transactions": [       
       {       
         "type": 2,        
         "id": "64hxaxZvB9iD1cfRf1j8KPTXs4qE7SHaDWTZKoUvgfVZotaJUtSGa5Bxi86ufAfp5ifoNAGknBqS9CpxBKG9RNVR",       
         "fee": 100000,        
         "timestamp": 1479313757194,       
         "signature": "64hxaxZvB9iD1cfRf1j8KPTXs4qE7SHaDWTZKoUvgfVZotaJUtSGa5Bxi86ufAfp5ifoNAGknBqS9CpxBKG9RNVR",        
         "sender": "3NBVqYXrapgJP9atQccdBPAgJPwHDKkh6A8",              
         "senderPublicKey": "CRxqEuxhdZBEHX42MU4FfyJxuHmbDBTaHMhM3Uki7pLw",        
         "recipient": "3N8UPtqiy322NVr1fLP7SaK1AaCU7oPaVuy",             
         "amount": 1000000000        
       }       
     ],        
     "generator": "3N5GRqzDBhjVXnCn44baHcz2GoZy5qLxtTh",             
     "signature": "4ZhZdLAvaGneLU4K4b2eTgRQvbBjEZrtwo1qAhM9ar3A3weGEutbfNKM4WJ9JZnV8BXenx8JRGVNwpfxf3prGaxd",        
     "fee": 100000,        
     "blocksize": 369        
   } 

GET /blocks/at/{height}
~~~~~~~~~~~~~~~~~~~~~~~

Возвращает содержимое блока на высоте {height}.

GET /blocks/seq/{from}/{to}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает содержимое блока на высоте в диапазоне {from} - {to}.

GET /blocks/signature/{signature}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает содержимое блока по его подписи {signature}.

GET /blocks/address/{address}/{from}/{to}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Возвращает все блоки сформированные (смайненные) адресатом {address}.
