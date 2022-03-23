class AppTexts {
  static List<String> sobreApp = [
    '''
O aplicativo Cálculo Saque Aniversário não tem qualquer 
relação com a instituição estatal CAIXA ou qualquer 
órgão governamental ou financeiro.
    ''',
    '''
O aplicativo é sem fins lucrativos e não armazenamos 
qualquer tipo de dado fornecido pelo usuário. Todos 
os dados solicitados são para uso exclusivo de nossa 
calculadora do Saque Aniversário. 
    ''',
  ];

  static List<String> sobreCalculo = [
    '''
O cálculo do Saque Aniversário é uma previsão não 
oficial de quanto você vai sacar no seu mês de 
aniversário, tendo como base o valor atual de 
seu saldo do FGTS, seu salário bruto mensal e 
o seu mês de nascimento. 
    ''',
    '''
O Cálculo é feito da seguinte forma: Primeiro 
verificamos quanto tempo falta para seu mês 
de aniversário, essa quantidade é multiplicada 
pelo valor de 8% de seu salário bruto (que é a 
quantia na qual a sua empresa deposita todos os 
meses eu sua conta do FGTS), o resultado desse 
cálculo inicial é o valor total de futuros 
lançamentos de saldo em sua conta do FGTS até 
sua data de aniversário (levando em consideração 
que seu salário não vai alterar nesse período). 
    ''',
    '''
Após termos o valor total de quanto provavelmente 
você terá em sua conta do FGTS no futuro, somamos 
esse valor ao saldo atual que está em sua conta do FGTS.
    ''',
    '''
O total geral (incluindo o futuro e atual saldo) é usado 
para determinar em qual alícota seu saldo se enquadra de 
acordo com a tabela fornecida pela CAIXA /(você pode 
consultar clicando aqui)/. Por fim após essa verificação 
podemos deteminar o valor que você sacará em seu mês de 
aniversário.
    ''',
    '''
Vale frisar que esse cálculo não é oficial, é somente uma 
previsão aproximada de quanto você sacará de saldo em sua 
conta do FGTS.
    ''',
  ];
}
