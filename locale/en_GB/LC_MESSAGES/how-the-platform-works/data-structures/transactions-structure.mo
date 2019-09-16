��    �      �  �   �	      (     )     /     6  .   K     z     |     �     �     �     �     �     �     �     �               2      6     W     [     {     ~     �  #   �     �     �     �     �               %     )     H     K     _     b     {     ~     �     �     �     �     �     �     �     �     �     �            /   *     Z     f     s     {     �     �     �     �     �     �     �     �     �     �     �                    #     )     0  
   8     C     J     Z  
   b     m     r     {     �     �     �  
   �     �     �  	   �     �     �     �     �     �     �     �     �     �  
               	   !  
   +  
   6     A     I     N     U     \  	   l     v     }     �  	   �     �     �  	   �     �     �     �    �  4   �  $     .   2     a  .   }    �  �   �     M  f   ^  }   �  X   C  Y   �     �  .     (   6  2   _  �   �     &  #   D  /   h  6   �  c   �     3  *   S  ]   ~  %   �  f        i     �     �  7   �  �   �  n   �  j   �     h       A  �     �     �     �     �     �     �               1     5     S     W     r     v     �     �     �      �     �     �     �              #   #      G      K      h      l      �      �      �      �      �      �      �      �      !     !     #!     %!     :!     <!     T!     V!     m!     o!     �!     �!     �!     �!  /   �!     �!     �!     "     	"     "     "     "     2"     8"     E"     S"     f"     u"     z"     �"     �"     �"     �"     �"     �"     �"  
   �"     �"     �"     �"  
   �"     �"      #     	#     #     #     +#     /#     ;#     B#  	   H#     R#     Z#     b#     g#     p#     w#     ~#     �#     �#  
   �#     �#     �#  	   �#  
   �#  
   �#     �#     �#     �#     �#     �#  	   $     $     $     $  	   &$     0$     <$     J$     ^$     a$     f$  �   n$  .   %     G%     \%     v%     �%  �   �%  .   ;&     j&  5   n&  P   �&  .   �&  .   $'     S'     _'     w'     �'  _   �'     (     !(     0(     =(  @   U(     �(     �(     �(     �(  .   �(     )      )     2)     ?)  X   [)  H   �)  F   �)     D*     K*     �   -   �      Y      �   !           o   r           >   �   b       �   9   �       7   h       D       L   �       �   �   j      }   ~   O   a   =   n   �   �       �   I   B   %   y      i   (   *   ,   .   t   0   2      )           8      �   �   d       
                  P      f   u       J   �       N                   <   �      @           �       ;       �          �       H       Q   p   �       M   E          e   �       C   ?   `   :   �           s       U       6   v   \       K          z   �   x   �                  3   V       R   �   ^   �              #       1   �       4   G       �           m   c   W   [           �   '               k   /   w   A   ]      5   g      |       Z       	   T       X          S   F               l         "   $      &      _   q       {   +    (opt) (txId) **Broadcasted JSON** **JSON для вызова метода sign** 1 1. Genesis transaction 10 10. CreateAliasTransaction 101 101. GenesisPermitTransaction 102 102. PermitTransaction 103 103. CreateContractTransaction 104 104. CallContractTransaction 105 105. ExecutedContractTransaction 106 106. DisableContractTransaction 11 11. MassTransferTransaction 110 110. GenesisRegisterNodeTransaction 111 111. RegisterNodeTransaction 112 112. CreatePolicyTransaction 113 113. UpdatePolicyTransaction 114 114. PolicyDataHashTransaction 12 12. DataTransaction 13 13. SetScriptTransaction 15 15. SetAssetScriptTransaction 3 3. issueTransaction 4 4. TransferTransaction 5 5. ReissueTransaction 6 6. BurnTransaction 8 8. LeaseTransaction 9 9. LeaseCancelTransaction :ref:`Genesis transaction <GenesisTransaction>` Array[Byte] Array[Bytes] Boolean Byte ByteStr Bytes ExecutableTransaction Field JSON to sign List[ByteStr] List[DataEntry[_]] List[Transfer] Long Option[Long] PermissionOp PublicKeyAccount String Type alias amount assetId attachment author authorPublicKey chainId contractId data dataHash decimals description dueTimestamp fee feeAssetId height image imageHash lease leaseId name nodeName opType owners params password policyId policyName proofs quantity recipient recipients reissuable results role script sender senderPublicKey signature status target targetPubKey timestamp totalAmount transferCount transfers tx type version В этом разделе приведена структура хранения транзакций в блокчейн-платформе Waves Enterprise. Для некоторых типов транзакций введено версионирование. Выдача/отзыв прав у аккаунта Вызов Docker-контракта Выполнение Docker-контракта Выпуск токенов Изменение группы доступа Когда пользователь отправляет конфиденциальные данные в сеть при помощи :ref:`POST /privacy/sendData <privacy-api>`, нода автоматически формирует транзакцию 114. Количество данных в секции "data" передаваемого JSON должно быть не более 100 пар ``"key":"value"`` Комиссия Массовый перевод токенов. Указана минимальная комиссия Назначение первого администратора сети для дальнейшей раздачи прав Ограничение на объём данных в секции "params" - 150 КБ. Ограничение на объём данных в секции "results" - 150 КБ. Описание Отключение Docker-контракта Отмена аренды токенов Отправка в сеть хеша данных Первоначальная привязка баланса к адресам создаваемых при старте блокчейна нод Перевод токенов Перевыпуск токенов Передача токенов в аренду Регистрация новой ноды в сети Регистрация ноды в генезис-блоке при старте блокчейна Сжигание токенов Создание Docker-контракта Создание группы доступа к конфиденциальным данным Создание псевдонима Суммарный объём передаваемых данных в секции "data" - 150 КБ. Тип транзакции Типы транзакций Транзакции Транзакция имеет ограничения: Транзакция с данными в виде полей с парой ключ-значение. Указана минимальная комиссия Транзакция, привязывающая скрипт с RIDE-контрактом к аккаунту Транзакция, привязывающая скрипт с RIDE-контрактом к ассету отсутствует № Project-Id-Version: WE
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2019-09-16 12:25+0300
Last-Translator: 
Language: en_US
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
X-Generator: Poedit 2.0.6
 (opt) (txId) **Broadcasted JSON** **JSON to sign** 1 1. Genesis transaction 10 10. Create Alias Transaction 101 101. GenesisPermitTransaction 102 102. PermissionTransaction 103 103. CreateContractTransaction 104 104. CallContractTransaction 105 105. ExecutedContractTransaction 106 106. DisableContractTransaction 11 11. MassTransfer Transaction 110 110. GenesisRegisterNodeTransaction 111 111. RegisterNodeTransaction 112 112. CreatePolicyTransaction 113 113. UpdatePolicyTransaction 114 114. PolicyDataHashTransaction 12 12. Data Transaction 13 13. SetScript Transaction 15 15. SetAssetScriptTransaction 3 3. Issue Transaction 4 4. Transfer Transaction 5 5. Reissue Transaction 6 6. Burn Transaction 8 8. Lease Transaction 9 9. Lease Cancel Transaction :ref:`Genesis transaction <GenesisTransaction>` Array[Byte] Array[Bytes] Boolean Byte ByteStr Bytes ExecutableTransaction Field JSON to sign List[ByteStr] List[DataEntry[_]] List[Transfer] Long Option[Long] PermissionOp PublicKeyAccount String Type alias amount assetId attachment author authorPublicKey chainId contractId data dataHash decimals description dueTimestamp fee fee assetId height image imageHash leaseId leaseId name nodeName opType owners params password policyId policyName proofs quantity recipient recipients reissuable results role script sender sender's public key signature status target targetPubKey timestamp totalAmount transferCount number of transfers tx type version In this section we can see the structure of transaction storage in the blockchain platform of Waves Enterprise. For some types of transactions, versioning is introduced. Issuance/withdrawal of rights from the account Docker-contract call Docker-contract execution Tokens issue Update the access group When the user sends confidential data to the network using :ref:`POST /privacy/sendData <privacy-api>`, the node automatically will create the 114 transaction. ``"key":"value"`` pairs count no more than 100 Fee Mass tokens transfer. Minimum commission is specified Assignment of the first network administrator for further distribution of rights Data size limit in "params" section is 150 KB. Data size limit in "params" section is 150 KB. Description Docker-contract disable Cancel of the tokens lease A data hash sending to the net Initial binding of the balance to the addresses of nodes created at the start of the blockchain Tokens transfer Tokens reissue Tokens lease A new node registration Node registration in the genesis block with the blockchain start Tokens burn Docker-contract creation Access group creation Alias creation Data size limit in "params" section is 150 KB. Transaction type Transaction types Transactions The transaction has limits: Transaction with the data in the key-value pairs format. Minimum commission is specified Transaction which is binding a script with a RIDE contract to an account Transaction which is binding a script with a RIDE contract to an asset no fee № 