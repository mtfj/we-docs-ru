��    	      d      �       �   d  �   �  F  Y  �     =  �   T  �    (   �  *   �  r  �  d  ^	  �  �
  Y  `     �  p   �  �   2     "     @                      	                        A holder stakes a portion of tokens to perform an action, i.e. adding a listing. Token holders can vote on whether to accept or reject the action using their tokens. A majority wins the vote and the action is accepted or rejected. The list is updated and should become more valuable given the improved listings and staked tokens are now out of circulation. In our smart account implementation, we check that user can add assets by a key = asset_name only with count = 0 and only in adding or "challenge" period. Also, we check that user has the corresponding tokens on a balance. Then, in the voting period, users can vote to every asset they have, but only once for each one and only with an assessment from 1 to 10. Their votes are put with keys user_address+assetID. Now there are many scam assets in our blockchain because we allow to create and transfer every asset if its creator pays a fee. Transfers are saved in blockchain and when the asset is a trash maybe we should protect our blockchain from it. It could be possible with the token curated registry - a registry of listings generated by token holders. Голосование Несколько примеров кода смарт-контрактов с комментариями для лучшего понимания механики работы RIDE. Поля транзакций можно использовать не по назначению, например в proofs можно класть любой байтовый объект, а не только подпись. И код контракта можно переписать потому что у нас есть поле author и нам не нужны эти костыли... Пример кода контракта Примеры написания кода Project-Id-Version: Vostok master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-02-17 16:18+0300
PO-Revision-Date: 2019-03-12 20:13+0300
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
Plural-Forms: nplurals=2; plural=(n != 1);
Last-Translator: 
Language-Team: 
Language: en
X-Generator: Poedit 2.2.1
 A holder stakes a portion of tokens to perform an action, i.e. adding a listing. Token holders can vote on whether to accept or reject the action using their tokens. A majority wins the vote and the action is accepted or rejected. The list is updated and should become more valuable given the improved listings and staked tokens are now out of circulation. In our smart account implementation, we check that user can add assets by a key = asset_name only with count = 0 and only in adding or "challenge" period. Also, we check that user has the corresponding tokens on a balance. Then, in the voting period, users can vote to every asset they have, but only once for each one and only with an assessment from 1 to 10. Their votes are put with keys user_address+assetID. Now there are many scam assets in our blockchain because we allow to create and transfer every asset if its creator pays a fee. Transfers are saved in blockchain and when the asset is a trash maybe we should protect our blockchain from it. It could be possible with the token curated registry - a registry of listings generated by token holders. Voting Here are some examples of coding smart contracts with comments for a better understanding of the RIDE mechanics. Transaction fields can be used for other purposes, for example, any byte object can be placed in proofs and not just a signature. The contract code can also be rewritten because we have the author field and we do not need these crutches... Example of coding of contract Examples of coding 