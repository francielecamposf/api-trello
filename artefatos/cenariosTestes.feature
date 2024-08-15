Contexto: Validar o form de transferencia bancaria do banco XYZ

Cenário: Realizar transferenca com sucesso 
Dado que o usuário está na página do formulário
E tenha realizado login com sucesso na aplicacao
E tenha saldo em conta superior ao valor da transferencia
Quando o  usuário preenche todos os <cliente> <valor> e <data_efetivacao> corretamente
E clica no botão Transferir
Então a transferência é processada com sucesso 
E uma mensagem de confirmação é exibida

Exemplos:
| cliente | valor | data_efetivacao |
| 'Maria da SIlva' | R$300 | '20224-10-10 01:08:00'|


Cenário: tentar realizar uma transferencia sem saldo em conta 
Dado que o usuário está na página do formulário
E tenha realizado login com sucesso na aplicacao
E não tenha saldo em conta superior ao valor da transferencia
Quando o  usuário preenche todos os <cliente> <valor> e <data_efetivacao> corretamente
E clica no botão Transferir
Então a transferência não é processada 
E uma mensagem de saldo insuficiente é exibida

Exemplos:
| cliente | valor | data_efetivacao |
| 'Maria da SIlva' | R$300 | '20224-10-10 01:08:00'|


Cenário: Realizar transferenca com dados inválidos 
Dado que o usuário está na página do formulário
E tenha realizado login com sucesso na aplicacao
E tenha saldo em conta superior ao valor da transferencia
Quando o  usuário não preenche os <cliente> <valor> e <data_efetivacao> corretamente
E clica no botão Transferir
Então a transferência não é processada 
E uma mensagem de transferencia nào concluída é exibida

Exemplos:
| cliente | valor | data_efetivacao |
| 'xxxx' | R$ xeuuuj | 'bbbb-gg-uu'|
| '$$$$$' | R$ &&***&* | '*&&7-%%-@#'|
| '233939444' | R$ 0 | '0000-00-99'|
| '99999999' | R$300 | '20224-10-10 01:08:00'|
| 'Maria da SIlva' | R$aa | '20224-10-10 01:08:00'|
| 'Maria da SIlva' | R$300 | '9999-99-77 01:08:00'|
| 'Maria da SIlva' | R$300 | '20224-10-10 25:99:98'|

Cenário: Realizar transferenca com campos em branco 
Dado que o usuário está na página do formulário
E tenha realizado login com sucesso na aplicacao
E tenha saldo em conta superior ao valor da transferencia
Quando o  usuário não preenche os <cliente> <valor> e <data_efetivacao>
Então o botão Transferir deve permanecer desabilitado 


Exemplos:
| cliente | valor | data_efetivacao |
| '' | R$  | ''|
| '' | R$300 | '20224-10-10 01:08:00'|
| 'Maria da SIlva' | R$ | '20224-10-10 01:08:00'|
| 'Maria da SIlva' | R$300 | ''|

Cenário: Cancelar o Preenchimento
Dado que o usuário está na página do formulário
E tenha realizado login com sucesso na aplicacao
Quando o  usuário preenche todos os <cliente> <valor> e <data_efetivacao> corretamente
E clica no botão Cancelar
Então o formulário deve ser resetado
E todos os campos preenchidos devem ser limpos.

Exemplos:
| cliente | valor | data_efetivacao |
| 'Maria da SIlva' | R$300 | '20224-10-10 01:08:00'|

Cenário: Tentar transferir com data e Valor acima do permitidos
Dado que o usuário está na página do formulário
E tenha realizado login com sucesso na aplicacao
E tenha saldo em conta superior ao valor da transferencia
Quando o  usuário preenche todos os <cliente> <valor> e <data_efetivacao>
E clica no botão Transferir
Então a transferência não é processada com sucesso 
E uma mensagem "valor acima do máximo permitido ou data de efetivacao maior que a data atual" é exibida

Exemplos:
| cliente | valor | data_efetivacao |
| 'Maria da SIlva' | R$1.000.000,00 | '20224-10-10 01:08:00'|
| 'Maria da SIlva' | R$1.000,00 | '20225-10-10 01:08:00'|
