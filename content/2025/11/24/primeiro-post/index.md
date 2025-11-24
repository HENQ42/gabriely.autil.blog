---
title: Exemplo dos Melhores Recursos do Hextra
date: 2023-10-27
description: "Um showcase interativo dos componentes mais poderosos do tema Hextra."
tags:
- blog
- site
---

Bem-vindo à demonstração dos recursos. Abaixo você verá como este tema transforma Markdown simples em documentação rica e interativa.

## 1. Callouts (Alertas)

Use callouts para destacar informações críticas. O Hextra suporta estilos do GitHub e ícones personalizados.

{{< callout type="info" >}}
**Informação:** Este é um callout padrão para notas gerais.
{{< /callout >}}

{{< callout type="warning" >}}
**Aviso:** Fique atento a detalhes importantes que o usuário não deve perder.
{{< /callout >}}

{{< callout type="error" >}}
**Erro:** Algo crítico que requer ação imediata.
{{< /callout >}}

---

## 2. Passos (Tutorial Interativo)

O componente `steps` é perfeito para tutoriais ou guias de instalação. Ele numera automaticamente e conecta os itens visualmente.

{{% steps %}}

### Passo 1: Instalar o Hugo
Primeiro, certifique-se de que você tem o Hugo instalado em sua máquina.

### Passo 2: Clonar o Repositório
Baixe o tema Hextra para o seu projeto.

### Passo 3: Configurar e Rodar
Adicione o tema ao seu `hugo.toml` e inicie o servidor local.

{{% /steps %}}

---

## 3. Abas e Código (Tabs)

Organize instruções para diferentes sistemas ou linguagens sem poluir a página.

{{< tabs items="npm,pnpm,yarn" >}}

{{< tab >}}
```bash
npm install hextra-theme
