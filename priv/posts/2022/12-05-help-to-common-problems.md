%{
  title: "Common Problems in Elixir",
  authors: ["Joey Bellerose"],
  tags: ~w(elixir),
  description: "How to work through common problems in Elixir"
}
---
# 3.4 - Help to Common Problems Blog

## Setup

```elixir
[1, 2, 3, 4]
|> Enum.map(&1 * 2)

```

What common problems can we expect to face?

Why do those problems matter?

In this section, you'll learn a few features Livebook has to help you learn code and become a more effiecint Data Scientist through the following three sections:

1. How to find function definitions and examples without leaving Livebook
2. How to read and understand an error message
3. How to see what happening in your pipeline with `dbg`

> #### Note
> 
> Pipelines are the combination of multiple functions with the pipe operator (`|>`):
> 
> ```elixir
>  stuff
>  |> Cool.function()
> ```
> 
> You will learn more about pipes in a future chapter.

<!-- livebook:{"break_markdown":true} -->

### 1) How To Find Function Definitions And Examples Without Leaving Livebook

Learning a new language requires effort. Everybody understands that it is not possible to have a new program language memorized on day one. To help you learn Elixir, developers have embedded the capability to see support documetation and examples at your fingertips.  This will help you learn more effectively and accelerate your learning curve.

The typical way of finding code examples and function definitions is something like this:

* Do a Google search for documenation
* Hope you clicked on the right version of the documentation
* Comb through the documentation for the specific function that you need

Elixir in Livebook allows you to:

* Hover over the function you type
* Recieve pop-up window with the
  * Function definition
  * Code examples
  * Link to the official documentation website

Check out the example below on hovering over the functions in your code.

Show `:color` by `class`

Show autocomplete for function selection, then Hover over function to help decide if it is what you want

```elixir

```

### 2) How To Read And Understand An Error Message

Errors are common in all programming languages. For most programming languages, error messages are not intuitive for beginners.  They often leave you wondering what the problem is and why it is happening.

Elixir is known for having better error messages and additional tools that help you quickly diagnose and resolve the errors hidden in your code

#### How is it better with Elixir?

The Elixir team has worked hard to create readable and helpful error messages.  The community have a motto of [failing fast](https://elixir-lang.org/getting-started/try-catch-and-rescue.html#fail-fast--let-it-crash) so that you can find errors early on before they have a chance to compound.  The capability to diagnose and resolve errors, as they occur, helps you confidently build analytical products that just work.

You can see a couple of error messages shown below.

Show `:color` by `class`

Change `mark` to `:block`

```elixir

```

* Show iterating through a `tuple` using `Enum.map`
* Show error description
* Show file and line location of error

```elixir

```

> #### Note
> 
> You can find the specific location of any cell by clinking on the link icon in the top right-hand corner of the Livebook cell.

* Show iterating through a `list` using `Enum.map` and multiplying a letter by 3
* Show error description
* Show file and line location of error

```elixir

```

### 3) How To See What Happens In Your Code Pipeline With `dbg`

Two big reasons why beginners have a difficult time learning languages are:

1. Knowing the syntax
2. Understanding what your computer is actually doing for each line of code

Learning the syntax requires work and can be solved by spending time with the language.

To solve the second problem, revealing what the code is doing at each step of the way within a pipeline, Elixir developers created the [`dbg`](https://hexdocs.pm/elixir/1.14.2/Kernel.html#dbg/2) function.

Check out the two examples shown below.

Show `:color` by `class` using `dbg`

```elixir

```

Convert `range` to `list` and multiply each element by 2 using `dgb`

```elixir

```

> #### Note
> 
> We will be discussing pipeline in more depth in a futute chapter

```elixir

```

### 4.) Livebook keyboard Shortcuts

As you spend more time in Livebook, you will naturally want to learn the keyboard shortcuts to speed up your analytical iterations.  Livebook provides you a keyboard button in the bottom left.  Clicking it will show a pop-up window with all the different keyboard shortcuts available to you.
