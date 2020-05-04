# Shibboleth-SP em container
Shibboleth v2.6.0
Apache2


### Avisos

* O script irá alterar algumas configurações no Dockerfile e no arquivo de configuração do shibboleth, localizado em ```./src/shibboleth```. Caso seja configurado o módulo ssl do apache, será alterado também o arquivo em ```./src/apache2```.

* O diretório ```./src/shibboleth``` está como volume do container. O diretório ```./src/apache2``` é configurado como volume quando selecionado a opção ssl.

* O script precisa ser executado apenas uma vez, em outras ocasiões deve-se utilizar os comando do docker.

** Para todas as questões haverá um campo de confirmação. Para responder afirmativo, digite s e enter, ou para apenas enter para proseguir. **

## Instalação

Executar o script shibboleth-sp como root.

git clone 

```
sudo ./shibboleth-sp

```

---
### Questionário

```
Deseja instalar o Docker?
(s)	SIM
(ENTER)	NÃO

```

Caso deseja utilizar algum domínio, selecione esta opção. (RECOMENDADO)
```
Deseja inserir um nome de domínio?
(s)	SIM
(ENTER)	NÃO

```

Caso a resposta anterior seja não, deverá indicar o IP externo da máquina.

```
Qual o IP?
>> 

```

É necessário idicar um contato técnico no métadado do SP.

```
Forneça um e-mail para contato técnico
>> 
```

```
Nome do contato técnico
>> 
```

```
Sobrenome do contato técnico
>> 
```

Configuração do apache:
```
Deseja configurar modo ssl no apache?
(s)     SIM
(ENTER) NÃO
```

Caso a resposta anterior seja sim:

* Primeiro será necessário indicar o caminho do diretório onde o certificado se encontra.

```
Caminho absoluto do certificado
Exemplo: /etc/ssl/certs
>>

```

E o nome do certificado:

```
Nome do arquivo .cer, .crt, .pem etc
Exemplo: certs/cert.crt
>> 

```

* Igualmente para a chave, primeiro o caminho do diretório

```
Caminho absoluto da chave
Exemplo: /etc/ssl/private
>> 

```

E o nome da chave:

```
Nome da chave "KeyFile" .key
Exemplo: cert.key
>>

```


---



# Released under MIT License

Copyright (c) 2013 Mark Otto.

Copyright (c) 2017 Andrew Fong.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

