��    �        �   �	      8     9     ?     F  .   [     �     �     �     �     �     �     �     �     �          !     %     B      F     g     k     �     �     �  #   �     �     �     �     �               5     9     X     [     o     r     �     �     �     �     �     �     �     �     �     �          
             /   :     j     v     �     �     �     �     �     �     �     �     �     �     �     �     	          '     3     :     ?     E     L  
   T     _     f     v  
   ~     �     �     �     �     �     �     �  
   �     �     �  	   �     �     �     �     �                         &  
   /     :     A  	   J  
   T  
   _     j     r     w     ~     �  	   �     �     �     �  	   �     �     �  	   �     �     �     �  �   �    �  �   �  4   a  $   �  .   �     �  .       5  �   :     �  f   �  }   O     �  .   �  (     2   6  �   i     �  #     /   ?  6   o  c   �     
  *   *  ]   U  %   �     �     �       7   (  �   `  n   �  j   m     �     �  j  �     ^     d     k     �     �     �     �     �     �     �     �     �                 .      2      O       S      t      x      �      �      �   #   �      �      �      !     !     "!     &!     C!     G!     f!     i!     ~!     �!     �!     �!     �!     �!     �!     �!     �!     �!     "     "     "     "     3"     5"  /   Q"     �"     �"     �"     �"     �"     �"     �"     �"     �"     �"     �"     �"     #     #      #     -#     >#     J#     Q#     V#     \#     c#  
   k#     v#     }#     �#  
   �#     �#     �#     �#     �#     �#     �#     �#     �#     �#     �#  	   �#     $     $     $     $     "$     )$     0$     7$     @$  
   I$     T$     [$  	   d$  
   n$  
   y$     �$     �$     �$     �$     �$  	   �$     �$     �$     �$  	   �$     �$     �$     �$     %     %     %  R    %  �   s%  v   &  .   �&     �&     �&     �&     �&  �   '  /   �'     �'  5   �'  P   !(     r(     ~(     �(     �(  _   �(     0)     @)     O)     \)  @   t)     �)     �)     �)     �)     �)     *     "*     /*  X   K*  H   �*  F   �*     4+     ;+     �   -   �      [      �   !           q   t   z       >   �   d       �   9   �       7   j       D       M   �       �   �   l      �   �   Q   c   =   p   �   �   �   �   J   B   %   }      k   (   *   ,   .   v   0   2      )           8      �   �   f       
                  R      h   w       K           O                   <          @           �       ;                  �       I       S   r   �       N   F          g   �       C   ?   b   :   �           u       W       6   x   ^       L           ~   �   {   �                  3   X       T   �   `   �              #       1   �       4   H   |   �           o   e   Y   ]           �   '               m   /   y   A   _      5   i      �   P   \       	   V       Z          U   G           E   n         "   $      &      a   s          +    (opt) (txId) **Broadcasted JSON** **JSON для вызова метода sign** 1 1. Genesis transaction 10 10. CreateAliasTransaction 101 101. GenesisPermitTransaction 102 102. PermitTransaction 103 103. CreateContractTransaction 104 104. CallContractTransaction 105 105. ExecutedContractTransaction 106 106. DisableContractTransaction 11 11. MassTransferTransaction 110 110. GenesisRegisterNodeTransaction 111 111. RegisterNodeTransaction 112 112. CreatePolicyTransaction 113 113. UpdatePolicyTransaction 114 114. PolicyDataHashTransaction 12 12. DataTransaction 13 13. SetScriptTransaction 15 15. SetAssetScriptTransaction 3 3. issueTransaction 4 4. TransferTransaction 5 5. ReissueTransaction 6 6. BurnTransaction 8 8. LeaseTransaction 9 9. LeaseCancelTransaction :ref:`Genesis transaction <GenesisTransaction>` Array[Byte] Array[Bytes] Boolean Byte ByteStr Bytes ExecutableTransaction Field JSON to sign List[ByteStr] List[DataEntry[_]] List[Transfer] Long Option[Long] PermissionOp PublicKeyAccount Size(Bytes) String Type alias amount assetId attachment author authorPublicKey chainId contractId contractName data dataHash decimals description dueTimestamp fee feeAssetId height image imageHash lease leaseId name nodeName opType owners params password policyId policyName proofs quantity recipient recipients reissuable results role script sender senderPublicKey signature status target targetPubKey timestamp totalAmount transferCount transfers tx type version Байтовое представление транзакции после подписания не должно превышать размер в 150 КБ. В этом разделе приведена структура хранения транзакций в блокчейн-платформе Waves Enterprise. Для некоторых типов транзакций введено версионирование. Все транзакции используют поле ``timestamp``, содержащее временную метку в формате **Unix Timestamp** в миллисекундах. Выдача/отзыв прав у аккаунта Вызов Docker-контракта Выполнение Docker-контракта Выпуск токенов Изменение группы доступа Когда пользователь отправляет конфиденциальные данные в сеть при помощи :ref:`POST /privacy/sendData <privacy-api>`, нода автоматически формирует транзакцию 114. Количество данных в секции "data" передаваемого JSON должно быть не более 100 пар ``"key":"value"``, Комиссия Массовый перевод токенов. Указана минимальная комиссия Назначение первого администратора сети для дальнейшей раздачи прав Описание Отключение Docker-контракта Отмена аренды токенов Отправка в сеть хеша данных Первоначальная привязка баланса к адресам создаваемых при старте блокчейна нод Перевод токенов Перевыпуск токенов Передача токенов в аренду Регистрация новой ноды в сети Регистрация ноды в генезис-блоке при старте блокчейна Сжигание токенов Создание Docker-контракта Создание группы доступа к конфиденциальным данным Создание псевдонима Тип транзакции Типы транзакций Транзакции Транзакция имеет ограничения: Транзакция с данными в виде полей с парой ключ-значение. Указана минимальная комиссия Транзакция, привязывающая скрипт с RIDE-контрактом к аккаунту Транзакция, привязывающая скрипт с RIDE-контрактом к ассету отсутствует № Project-Id-Version: WE
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-10-29 14:11+0300
PO-Revision-Date: 2019-10-29 17:43+0300
Last-Translator: 
Language: en_US
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
X-Generator: Poedit 2.2.1
 (opt) (txId) **Broadcasted JSON** **JSON to sign** 1 1. Genesis transaction 10 10. Create Alias Transaction 101 101. GenesisPermitTransaction 102 102. PermissionTransaction 103 103. CreateContractTransaction 104 104. CallContractTransaction 105 105. ExecutedContractTransaction 106 106. DisableContractTransaction 11 11. MassTransfer Transaction 110 110. GenesisRegisterNodeTransaction 111 111. RegisterNodeTransaction 112 112. CreatePolicyTransaction 113 113. UpdatePolicyTransaction 114 114. PolicyDataHashTransaction 12 12. Data Transaction 13 13. SetScript Transaction 15 15. SetAssetScriptTransaction 3 3. Issue Transaction 4 4. Transfer Transaction 5 5. Reissue Transaction 6 6. Burn Transaction 8 8. Lease Transaction 9 9. Lease Cancel Transaction :ref:`Genesis transaction <GenesisTransaction>` Array[Byte] Array[Bytes] Boolean Byte ByteStr Bytes ExecutableTransaction Field JSON to sign List[ByteStr] List[DataEntry[_]] List[Transfer] Long Option[Long] PermissionOp PublicKeyAccount Size(Bytes) String Type alias amount assetId attachment author authorPublicKey chainId contractId contractName data dataHash decimals description dueTimestamp fee fee assetId height image imageHash leaseId leaseId name nodeName opType owners params password policyId policyName proofs quantity recipient recipients reissuable results role script sender sender's public key signature status target targetPubKey timestamp totalAmount transferCount number of transfers tx type version The byte composition of the signed transaction should not exceed more than 150 KB. In this section we can see the structure of transaction storage in the blockchain platform of Waves Enterprise. For some types of transactions, versioning is introduced. All transactions use the ``timestamp`` field containing a time stamp in the **Unix Timestamp** format in milliseconds. Issuance/withdrawal of rights from the account Docker-contract call Docker-contract execution Tokens issue Update the access group When the user sends confidential data to the network using :ref:`POST /privacy/sendData <privacy-api>`, the node automatically will create the 114 transaction. ``"key":"value"`` pairs count no more than 100, Fee Mass tokens transfer. Minimum commission is specified Assignment of the first network administrator for further distribution of rights Description Docker-contract disable Cancel of the tokens lease A data hash sending to the net Initial binding of the balance to the addresses of nodes created at the start of the blockchain Tokens transfer Tokens reissue Tokens lease A new node registration Node registration in the genesis block with the blockchain start Tokens burn Docker-contract creation Access group creation Alias creation Transaction type Transaction types Transactions The transaction has limits: Transaction with the data in the key-value pairs format. Minimum commission is specified Transaction which is binding a script with a RIDE contract to an account Transaction which is binding a script with a RIDE contract to an asset no fee № 