99-haskell
==========

# Ninety-Nine Haskell Problems

## What is this?

This is an adaptation of [Ninety-Nine Lisp Problems](http://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html).

## How to install?

First of all, you need a [GitHub account](https://github.com/join) so you can [fork this repo](https://github.com/mkovacs/99-haskell/fork).

You'll also need [git](http://git-scm.com/) to clone your forked repo, as well as [GHC & Cabal](https://www.haskell.org/platform/) to build and test your solutions.

Clone the repo via
```
git clone <uri-to-your-repo>
```

Then from withing the repo's directory, execute
```
cabal install --dependencies-only
```

## Now what?

Your task is to replace the ```undefined``` values such that the tests pass.

You can execute the tests for the first ten problems using
```
cabal test problems-01-10
```

The interactive shell can also be very helpful:
```
cabal repl problems-01-10
```
