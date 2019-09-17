��                        �  /   �  M   -  ,   {  �   �  m  �  !  �  <    �   Z	  �  �	    b  �   u  L     Z   U  �   �  F  d  r   �  #     �   B     1     P  �   j  m     -  v  :  �  A   �  N   !  0   p  �   �     E  W  T     �  %   �     �       �  �  �   #  ]  �  H   1!    z!  �   �#  I   -$  .   w$  ;   �$  P   �$  �   3%  O   �%     ?&  v   T&     �&     �&  I   �&  4   6'  �   k'  �  (     �*  -   �*     �*  V   +     ^+   1. Процесс создания Liquid Block 2. Механизм вознаграждения майнеров в Waves-NG 3. Разрешение конфликтов Liquid Block — служебный термин, для описания состояния блока до выпуска следующего ключевого блока, т.е. завершения его майнинга. Waves-NG — разработан Waves Platform на основе `Bitcoin-NG <https://www.usenix.org/system/files/conference/nsdi16/nsdi16-paper-eyal.pdf>`_ для повышения пропускной способности блокчейна Waves, на архитектуре которого реализован Waves Enterprise. Идея протокола — в каждом раунде майнинга создавать не 1 большой блок, а непрерывно создавать микроблоки. Маленькие блоки быстрее пересылать и проверять. Блок — зафиксированный в блокчейне набор транзакций, подписанный майнером и содержащий ссылку на подпись предыдущего блока. Ограничен 1Мб или 6000 транзакций. В протоколе предусмотрена финансовая мотивация соблюдения правил для участников. Комиссия от транзакций в блоке распределяется в пропорции 40% майнеру создавшему блок и 60% майнеру следующего блока. Транзакция по начислению комиссии происходит через 100 блоков для обеспечения доверительного интервала проверок. Доказательство доли владения — получение права майнинга в консенсусе PoS. Если майнер продолжает цепочку, создавая два микроблока с одним и тем же родителем, он наказывается отменой дохода от комиссий; тот, кто обнаруживает мошенничество, получает награду майнера за блок. Блокчейн — распределенная система и каждая нода хранит копию состояния всей сети. При появлении очередного микроблока, нода применяет полученные изменения к своей копии состояния сети и сверяет с остальными узлами сети. В этот момент происходит обнаружение несогласованности транзакций. Каждые 5 секунд майнер создает и рассылает по сети микроблок, который содержит транзакции. Он должен ссылаться на предыдущий микро- или ключевой блок. Ключевой блок — не содержит транзакций, только служебную информацию, такую как: Консенсусом определяется майнящий адрес. Майнер создает и рассылает по сети ключевой блок. Майнер — нода, адрес которой обладает достаточным для майнинга балансом и разрешением «Майнинг». Микроблоки — служебный термин, наборы транзакций, применяемых к состоянию блокчейна раз в 5 секунд. Ограничен 500 транзакциями. Каждый микроблок подпсан приватным ключом майнера. Нода — узел сети с запущенным приложением блокчейна Waves Enterprise. Описание протокола Описание протокола работы блокчейна Waves Enterprise, обеспечивающего преимущество производительности относительно других блокчейнов. Подпись майнера. Протокол Waves-NG Процесс продолжается до тех пор, пока в сети не появится новый валидный ключевой блок. Публичный ключ майнера — для проверки подписи микроблоков. Раунд — период времени между выпуском ключевых блоков. Плавающее значение, регулируется алгоритмом консесуса в зависимости от нагрузки на сеть, в среднем 40 секунд. Раунды майнинга начинаются с выпуска ключевого блока. Момент появления каждого ключевого блока и адрес указанного в нём майнера определяются консенсусом, подробнее :ref:`Консенсус <consensus>`. Ключевой блок, не содержащий транзакций, только доказательство — формируется быстро. Далее, до появления следующего блока, раз в 5 секунд формируются микроблоки с транзакциями без доказательства доли, что также повышает скорость обработки. Каждый блок микроблок ссылается на предыдущий. Ключевой блок добавляется в блокчейн, как только следующий майнер выпустит свой ключевой блок, со ссылкой на него. Ссылку на предыдущий ключевой блок. Сумму комиссии майнера за предыдущий блок. Схема разделения комиссий Такой подход снижает время подтверждения транзакции по сравнению с другими блокчейнами. Термины Project-Id-Version: Vostok master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-09-02 15:12+0300
PO-Revision-Date: 2019-09-02 16:00+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 1. Creating a Liquid Block 2. Miner reward mechanism in Waves-NG 3. Conflict resolution Liquid Block — a service term to describe the state of a block before issuing the next key block, i.e. completing its mining. Waves-NG - developed by Waves Platform based on `Bitcoin-NG <https://www.usenix.org/system/files/conference/nsdi16/nsdi16-paper-eyal.pdf>`_ to increase the throughput of the Waves blockchain based on whose architecture Waves Enterprise is implemented. The idea of the protocol is to create not 1 large block in each round of mining but continuously create microblocks. Small blocks are faster to forward and check. Block — a set of transactions registered in the blockchain signed by the miner and containing a link to the proof of the previous block. Limited to 1MB or 6000 transactions. The protocol has a provision for financial incentive for participants' compliance with the rules. The fee from transactions in the block is distributed in the proportion of 40% for miner who created the block and 60% for the miner of the following block. The fee credit transaction is performed after 100 blocks to ensure a trust interval of checks. Proof of ownership — acquisition of mining right in the PoS consensus. If the miner continues the chain creating two microblocks with the same parent, it is punished by cancellation of income from fees; the one who discovers the fraud receives the miner's award for the block. Blockchain is a distributed system and each node stores a copy of the state of the entire network. When the next microblock appears, the node applies the received changes to its copy of the state of the network and checks against other nodes of the network. At this point, the transaction inconsistency can be detected. Every 5 seconds, the miner creates and sends out to the network a microblock which contains transactions. It must be linked to the previous microblock or key block. Key block — contains no transactions, only service information such as: The mining address is determined by consensus. A miner creates and distributes a key block on the network. Miner — a node whose address has sufficient balance and a "mining" permission. Microblocks — a service term, sets of transactions applied to the state of blockchain every 5 seconds. Limited to 500 transactions. Each microblock is signed by the miner's private key. Node — network host with the Waves Enterprise blockchain application running. Protocol description Description of Waves Enterprise Operation Protocol which provides performance advantage relative to other blockchains. Miner's proof. Waves-NG Protocol The process continues until a new valid key block appears on the network. Miner public key — to verify proof of microblocks. Round — a period of time between issuance of key blocks. A floating value is controlled by the consesus algorithm depending on the load on the network, averaging 40 seconds. Mining rounds begin with generation of the key block. The moment of occurrence of each key block and the address of the miner identified in it are determined by consensus, for more details see :ref:`Consensus <consensus>`. A key block containing no transactions, but only proof, is generated quickly. Further, before the next block is generated, once in 5 seconds microblocks with transactions are generated without proof of a stake which also increases the speed of processing. Each block of the microblock is linked to the previous one. The key block is added to the blockchain as soon as the next miner generates its key block with a link to it. Link to previous key block. Amount of miner's fee for the previous block. Fee distribution diagram This approach reduces the time to confirm a transaction compared to other blockchains. Terms 