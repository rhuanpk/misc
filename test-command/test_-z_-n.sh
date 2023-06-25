#!/bin/bash

foo=''
bar=

echo -n 'testing foo: '
[ -z "$foo" ] && echo vazio || echo 'não vazio'
echo -n 'testing bar: '
[ -z "$bar" ] && echo vazio || echo 'não vazio'
echo -n 'testing xpto: '
[ -z "$xpto" ] && echo vazio || echo 'não vazio'

echo -n 'testing foo: '
[ -n "$foo" ] && echo cheio || echo 'não cheio'
echo -n 'testing bar: '
[ -n "$bar" ] && echo cheio || echo 'não cheio'
echo -n 'testing xpto: '
[ -n "$xpto" ] && echo cheio || echo 'não cheio'

echo -----------------------

foo='hello'
bar=world

echo -n 'testing foo: '
[ -z "$foo" ] && echo vazio || echo 'não vazio'
echo -n 'testing bar: '
[ -z "$bar" ] && echo vazio || echo 'não vazio'
echo -n 'testing xpto: '
[ -z "$xpto" ] && echo vazio || echo 'não vazio'

echo -n 'testing foo: '
[ -n "$foo" ] && echo cheio || echo 'não cheio'
echo -n 'testing bar: '
[ -n "$bar" ] && echo cheio || echo 'não cheio'
echo -n 'testing xpto: '
[ -n "$xpto" ] && echo cheio || echo 'não cheio'
