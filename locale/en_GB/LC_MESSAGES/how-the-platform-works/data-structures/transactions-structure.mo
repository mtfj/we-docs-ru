��    �        �   �	      8     9     ?     F  .   [  	   �  	   �     �     �     �     �     �     �     �     �               5     9     V      Z     {          �     �     �  #   �     �     �               (     ,     I     M     l     o     �     �     �     �     �     �     �     �     �     �     �     �               !     #     :     <     P     R  Q   l     �     �     �     �     �     �     �                    )     <     K     P  3   ]     �     �     �  6   �     �     �     �     �       
                  /     =     F  
   N     Y     ^     g     s     �  
   �     �     �  	   �     �     �     �     �     �     �     �     �     �  	   �  
   �     �                 	   !     +     2  	   B     L     S     Z  	   g     q     }  	   �     �     �     �    �  4   �  $   �  .        3  .   O     ~  .   �  }   �     <  .   M  (   |  2   �  �   �     l  #   �  /   �  6   �  c        y  *   �  ]   �  %   "     H     d  e   y  n   �  j   N     �     �  r  �     G     M     T     i  	   z  	   �     �     �     �     �     �     �     �     �               +     /     L      P     q     u     �     �     �  #   �     �     �     �               #     @     D     c     f     {     ~     �     �     �     �     �     �     �     �     �     �          
                8     :     O     Q     m     �     �     �     �     �     �     �     �     �     �     �                       ,      K      X      ^   !   o      �      �      �      �      �   
   �      �      �      �      �      �   
   �      �      !     !     !     %!     )!     5!     <!  	   B!     L!     T!     \!     a!     j!     q!     x!     �!     �!  	   �!  
   �!     �!     �!     �!     �!  	   �!     �!     �!  	   �!     �!     �!     "  	   "     "     )"     7"     K"     N"     S"  �   ["  .   �"     "#     7#     Q#     ^#     v#     z#  P   �#     �#     �#     $     $  _   >$     �$     �$     �$     �$  @   �$     #%     /%     H%     ^%     m%     ~%  7   �%  H   �%  F   &     S&     Z&     �   1   �      c   	   �   #           w   W              �   �           ?   p   a   =   n       L   o   U   �       �   �   K      �   �   Z       C   v   �   �       �   R   H   '          +   ,   .   0   2   4   6   8      -       |   >      �   �   k                                z   M       S       �   Y               "   B   I       F                   A           �      �       Q       [   x   �       X   N          l   �       J   E   i   @   �   5   �   {   r   _       <   ~   f   �   T           �   �       �           q      9   `       \   :   �   �              %       7   �           P       �           V   j   /   e           u   *           }   s   3      G   g      ;   m   !   h   D   d          ^       b          ]   O               t   
      $   &      (      )   y               (opt) (txId) **Broadcasted JSON** **JSON для вызова метода sign** +(order1) +(order2) 1 1. Genesis transaction 10 10. CreateAliasTransaction 101 101. GenesisPermitTransaction 102 102. PermitTransaction 103 103. CreateContractTransaction 104 104. CallContractTransaction 105 105. ExecutedContractTransaction 106 106. DisableContractTransaction 11 11. MassTransferTransaction 110 110. GenesisRegisterNodeTransaction 111 111. RegisterNodeTransaction 112 112. CreatePolicyTransaction 113 113. UpdatePolicyTransaction 114 114. PolicyDataHashTransaction 12 12. DataTransaction 13 13. SetScriptTransaction 14 15 15. SetAssetScriptTransaction 2 3 3. issueTransaction 4 4. TransferTransaction 5 5. ReissueTransaction 6 6. BurnTransaction 7 7. ExchangeTransaction 8 8. LeaseTransaction 9 9. LeaseCancelTransaction :ref:`Exchange Transaction (не используется) <ExchangeTransaction>` Array[Byte] Array[Bytes] Boolean Byte ByteStr Bytes ExecutableTransaction Field JSON to sign List[ByteStr] List[DataEntry[_]] List[Transfer] Long Option[Long] Payment Transaction (не используется) PermissionOp Price PublicKeyAccount SponsorFee Transaction (не используется) String Type alias amount assetId attachment author authorPublicKey buyMatcherFee buyOrder chainId contractId data decimals description dueTimestamp fee feeAssetId height image imageHash lease leaseId name nodeName opType params password proofs quantity recipient reissuable results role script sellMatcherFee sellOrder sender senderPublicKey signature status target targetPubKey timestamp totalAmount transferCount transfers tx type version В этом разделе приведена структура хранения транзакций в блокчейн-платформе Восток. Для некоторых типов транзакций введено версионирование. Выдача/забор прав у аккаунта Вызов Docker-контракта Выполнение Docker-контракта Выпуск токенов Изменение группы доступа Комиссия Массовый перевод токенов Назначение первого администратора сети для дальнейшей раздачи прав Описание Отключение Docker-контракта Отмена аренды токенов Отправка в сеть хеша данных Первоначальная привязка баланса к адресам создаваемых при старте блокчейна нод Перевод токенов Перевыпуск токенов Передача токенов в аренду Регистрация новой ноды в сети Регистрация ноды в генезис-блоке при старте блокчейна Сжигание токенов Создание Docker-контракта Создание группы доступа к конфиденциальным данным Создание псевдонима Тип транзакции Транзакции Транзакция с данными в виде полей с парой ключ-значение Транзакция, привязывающая скрипт с RIDE-контрактом к аккаунту Транзакция, привязывающая скрипт с RIDE-контрактом к ассету отсутствует № Project-Id-Version: Vostok master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-04 17:49+0300
PO-Revision-Date: 2019-06-04 18:09+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
X-Generator: Poedit 2.2.1
 (opt) (txId) **Broadcasted JSON** **JSON to sign** +(order1) +(order2) 1 1. Genesis transaction 10 10. Create Alias Transaction 101 101. GenesisPermitTransaction 102 102. PermissionTransaction 103 103. CreateContractTransaction 104 104. CallContractTransaction 105 105. ExecutedContractTransaction 106 106. DisableContractTransaction 11 11. MassTransfer Transaction 110 110. GenesisRegisterNodeTransaction 111 111. RegisterNodeTransaction 112 112. CreatePolicyTransaction 113 113. UpdatePolicyTransaction 114 114. PolicyDataHashTransaction 12 12. Data Transaction 13 13. SetScript Transaction 14 15 15. SetAssetScriptTransaction 2 3 3. Issue Transaction 4 4. Transfer Transaction 5 5. Reissue Transaction 6 6. Burn Transaction 7 7. Exchange Transaction 8 8. Lease Transaction 9 9. Lease Cancel Transaction Exchange Transaction (not used) Array[Byte] Array[Bytes] Boolean Byte ByteStr Bytes ExecutableTransaction Field JSON to sign List[ByteStr] List[DataEntry[_]] List[Transfer] Long Option[Long] Payment Transaction (not used) PermissionOp Price PublicKeyAccount SponsorFee Transaction (not used) String Type Alias Amount assetId Attachment Author authorPublicKey buyMatcherFee buyOrder chainId contractId Data Decimals Description dueTimestamp Fee Fee assetId Height Image ImageHash LeaseId LeaseId Name nodeName opType params Password proofs Quantity Recipient Reissuable results Role Script sellMatcherFee sellOrder Sender Sender's public key Signature Status Target targetPubKey timestamp totalAmount transferCount Number of transfers tx Type version This module contains the structure of transaction storage in the Vostok blockchain platform. Versioning has been introduced for some transaction types. Issuance/withdrawal of rights from the account Docker-contract call Docker-contract execution Tokens issue Update the access group Fee Mass tokens transfer Assignment of the first network administrator for further distribution of rights Description Docker-contract disable Cancel of the tokens lease A data hash sending to the net Initial binding of the balance to the addresses of nodes created at the start of the blockchain Tokens transfer Tokens reissue Tokens lease A new node registration Node registration in the genesis block with the blockchain start Tokens burn Docker-contract creation Access group creation Alias creation Transaction type Transactions Transaction with the data in the key-value pairs format Transaction which is binding a script with a RIDE contract to an account Transaction which is binding a script with a RIDE contract to an asset no fee # 