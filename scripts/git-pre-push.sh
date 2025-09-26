#!/bin/sh

echo "Running pre-push checks..."

echo "\n=== Running linting ==="
if ! buf lint; then
    echo "\n❌ Linting failed! Please fix the issues before pushing.\n"
    exit 1
fi

echo "\n=== Running codegen ==="
if ! buf generate; then
    echo "\n❌ Codegen failed! Please fix the issues before pushing.\n"
    exit 1
fi

echo "\n✅ All checks passed! Pushing can continue...\n"
