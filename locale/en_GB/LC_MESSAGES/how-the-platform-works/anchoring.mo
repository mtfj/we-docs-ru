��    8      �  O   �      �     �     �     �     �     �     �     �     �     �     �  _   �  I   M  $   �  /   �  2   �  )     J   I  F   �  6   �  o        �  %   �  2   �  k   �  i   Y  }   �  p   A	     �	  D   �	  �   
  �  �
  �   ;  �   �  ~   u  !   �  �    �  �  E   �     �  {   �  K   Z    �  �  �  K   ?  �  �  n     �   �  n     $   �  A   �  (   �  /     e   H  �   �  k  3  r  �      "     "     "     "     "     "     "      "     ""     $"  H   &"  I   o"  $   �"  /   �"  2   #  )   A#  J   k#  F   �#  6   �#  o   4$     �$      �$  &   �$  H   �$  9   G%  N   �%  N   �%  	   &     )&  y   E&  �  �&  S   u(  H   �(  T   )     g)    v)  '  �*  5   �-     �-  B   �-  -   (.  �   V.    �.     �/  �   0  G   �0  X   41  7   �1     �1  '   �1     �1     2  9   2  D   X2  n  �2            1       0   8   ,   #                   $       .       "   5                           2   +                               &      4   %      /                  3                        	   
                '   !           )   -                     6   (   7   *                0 1 2 3 4 5 6 7 8 9 Mainnet не ответил на запрос об информации о транзакции ``Anchoring transaction in mainnet disappeared after height rise enough`` ``Fail send transaction to Mainnet`` ``Fail to create data transaction for Mainnet`` ``Fail to create sidechain anchoring transaction`` ``Fail to get current height in Mainnet`` ``Fail to parse http body of response from mainnet transaction broadcast`` ``Invalid http status of response from mainnet transaction broadcast`` ``Mainnet didn't respond on transaction info request`` ``Mainnet return transaction with id='$mainnetTxId' but it differ from transaction that we sent id='$sentTxId`` ``Unknown error`` ``error-code`` - код ошибки. ``error-message`` - описание ошибки. ``height`` - высота сохраняемого блока из приватного блокчейна. ``mainnet-tx-id`` - идентификатор транзакции для анкоринга в Mainnet. ``mainnet-tx-timestamp`` - дата и время создания транзакции для анкоринга в Mainnet. ``signature`` - подпись сохраняемого блока из приватного блокчейна. Анкоринг Анкоринг работает следующим образом: Анкоринг транзакция пропала из Mainnet после увеличения высоты на значение ``height-above`` В приватном блокчейне транзакции обрабатываются определенным списком участников, каждый из которых заранее известен. Малое, по сравнению с публичной сетью, количество участников блоков и транзакций в приватном блокчейне несёт угрозу подмены информации. Перезапись цепочки блоков и транзакций, особенно в случае использования PoS консенсуса, становится реальной. В результате отправки транзакции в Mainnet вернулся нераспознаваемый JSON-запрос В результате отправки транзакции в Mainnet вернулся отличный от первой транзакции идентификатор В результате публикации транзакции в Mainnet вернулся отличный от 200 код Возможная причина Выполняются :ref:`настройки анкоринга <anchoring-settings>` в конфигурационном файле ноды приватного блокчейна. При указании параметров, ответственных за работу анкоринга, устанавливайте рекомендованные значения, чтобы избежать сложностей в работе приватного блокчейна. Для повышения доверия участников приватного блокчейна к размещенным в нём данным разработан механизм анкоринга. Анкоринг позволяет проверить данные на неизменность. Гарантия неизменности достигается публикацией данных из приватного блокчейна в более крупную сеть, где подмена данных маловероятна из-за большего количества участников и блоков. Публикуемые данные — подпись и высота блоков приватной сети. Взаимная связность двух и более сетей повышает их стойкость, т.к. для подлога или изменнения данных в результате `long-range атаки <https://medium.com/@abhisharm/understanding-proof-of-stake-through-its-flaws-part-3-long-range-attacks-672a3d413501/>`_ необходимо атаковать все связанные сети. Как работает анкоринг в блокчейне Vostok Код Не удалось опубликовать анкоринг транзакцию в приватном блокчейне Не удалось получить текущую высоту в Mainnet Нода выполняет проверку высоты блокчейна в Mainnet каждые 30 секунд, пока высота не достигнет значения **высота созданной транзакции +** ``height-above``. Ошибки в анкоринге могут возникать на любом этапе. В случае возникновения ошибок в приватном блокчейне всегда публикуется :ref:`Data Transaction <DataTransaction>` с кодом и описанием ошибки. Транзакция об ошибке содержит следующие данные: Ошибки, возникающие в процессе анкоринга При достижении высоты блокчейна Mainnet, определённой в пункте 3, и положительной проверке наличия первой транзакции в блокчейне Mainnet нода создаёт вторую транзакцию с данными для анкоринга уже в приватном блокчейне. При отправке транзакции в Mainnet произошла неизвестная ошибка Публикация транзакции в Mainnet завершилась ошибкой (это может быть ошибка JSON-запроса) Создание транзакции для отправки в Mainnet завершилась ошибкой Сообщение об ошибке Структура транзакции для анкоринга Схема анкоринга в Mainnet Типы ошибок при анкоринге Транзакция для отправки в Mainnet содержит следующие поля: Транзакция, создаваемая в приватном блокчейне, содержит следующие поля: Через каждый заданный диапазон блоков ``height-range`` нода фиксирует информацию о блоке на высоте ``current-height - threshold`` в виде транзакции в Mainnet. В качестве такой транзакции используется :ref:`Data Transaction <DataTransaction>` со списком пар полей ``key-value``, описание которых представлено :ref:`ниже <anchoring-transaction>`. После отправки транзакции нода получает её высоту в Mainnet. Project-Id-Version: Vostok master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-08-14 15:20+0300
PO-Revision-Date: 2019-08-14 15:39+0300
Last-Translator: 
Language: en
Language-Team: 
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
X-Generator: Poedit 2.2.1
 0 1 2 3 4 5 6 7 8 9 The Mainnet has not responded for the request about the transaction info ``Anchoring transaction in mainnet disappeared after height rise enough`` ``Fail send transaction to Mainnet`` ``Fail to create data transaction for Mainnet`` ``Fail to create sidechain anchoring transaction`` ``Fail to get current height in Mainnet`` ``Fail to parse http body of response from mainnet transaction broadcast`` ``Invalid http status of response from mainnet transaction broadcast`` ``Mainnet didn't respond on transaction info request`` ``Mainnet return transaction with id='$mainnetTxId' but it differ from transaction that we sent id='$sentTxId`` ``Unknown error`` ``error-code`` - the error code. ``error-message`` - the error message. ``height`` - the height of the chosen block from the private blockchain. ``mainnet-tx-id`` - the Mainnet anchoring transaction ID. ``mainnet-tx-timestamp`` - the timestamp of the Mainnet anchoring transaction. ``signature`` - the signature of the chosen block from the private blockchain. Anchoring Anchoring works as follows: The anchoring transaction has disappeared from the Mainnet after the achieving the height with the ``height-above`` value One of the main ideas of the private blockchain is that transactions are processed by a certain number of participants known in advance. In a private blockchain there is a threat of information spoofing, because the number of participants is quite small if we compare it to the public blockchain where there are no restrictions to join the network. When using PoS consensus algorithm, the threat of overwriting a blockchain becomes real. The Mainnet has returned the unknown JSON request after the transaction publication The Mainnet has returned mismatched ID after the transaction publication The Mainnet has returned a different code than 200 after the transaction publication Possible cause Perform :ref:`anchoring settings <anchoring-settings>` in the configuration file of the private blockchain node. Please, use the recommended values to avoid difficulties in private blockchain operation when specify the parameters values responsible for the anchoring. To increase the confidence of the private blockchain participants in data placed there, the anchoring mechanism was developed. Anchoring allows checking the data for invariability. The guarantee of invariability is achieved by publishing data from a private blockchain to a larger network, where data spoofing is unlikely due to a larger number of participants and blocks. Published data represent a signature and a height of blocks in a private network. Mutual connectivity of two or more networks increases their resistance, because as a result of `a long-range attack <https://medium.com/@abhisharm/understanding-proof-of-stake-through-its-flaws-part-3-long-range-attacks-672a3d413501/>`_ as forgery or alteration of data resulting from a long-range attack would require attacking all connected networks. How does the anchoring works in the Vostok blockchain Code Fail to public the anchoring transaction in the private blockchain Fail to get the current height of the Mainnet The node is checking the Mainnet blockchain height each 30 seconds until the height reaches the **the height of the created transaction +** ``height-above``. Errors during the anchoring can occur at any step. In case of any error in the private blockchain the :ref:`Data Transaction <DataTransaction>` containing the error code and description is always published. The error transaction includes the following data: Errors during the anchoring When the height, defined in the item 3, is reached and the verification of the first transaction in the Mainnet blockchain is positive, the node creates the second anchoring data transaction in the private blockchain. An unknown error occurred during sending the transaction to the Mainnet The transaction publication to the Mainnet has failed (it could be a JSON request error) Creating a transaction to be sent to the Mainnet failed Message Transaction structure for the anchoring The Mainnet anchoring scheme Error types The Mainnet transaction consists of the following fields: The private blockchain transaction consists of the following fields: The node is creating the anchoring transaction to the Mainnet each specified blocks range ``height-range`` at the height ``current-height - threshold``. The :ref:`Data Transaction <DataTransaction>` with a ``key-value`` list is used as :ref:`an anchoring transaction <anchoring-transaction>`. The node requests the transaction height after sending it to the Mainnet. 