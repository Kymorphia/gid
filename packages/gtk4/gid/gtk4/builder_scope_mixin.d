/// Module for [BuilderScope] interface mixin
module gid.gtk4.builder_scope_mixin;

public import gid.core.basictypes;
public import gid.gtk4.builder_scope_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    Provides language binding support to [gid.gtk4.builder.Builder].
    
    The goal of [gid.gtk4.builder_scope.BuilderScope] is to look up programming-language-specific
    values for strings that are given in a [gid.gtk4.builder.Builder] UI file.
    
    The primary intended audience is bindings that want to provide deeper
    integration of [gid.gtk4.builder.Builder] into the language.
    
    A [gid.gtk4.builder_scope.BuilderScope] instance may be used with multiple [gid.gtk4.builder.Builder] objects,
    even at once.
    
    By default, GTK will use its own implementation of [gid.gtk4.builder_scope.BuilderScope]
    for the C language which can be created via [gid.gtk4.builder_cscope.BuilderCScope.new_].
    
    If you implement [gid.gtk4.builder_scope.BuilderScope] for a language binding, you
    may want to (partially) derive from or fall back to a [gid.gtk4.builder_cscope.BuilderCScope],
    as that class implements support for automatic lookups from C symbols.
*/
template BuilderScopeT()
{
}

/// Fluent builder implementation template for [gid.gtk4.builder_scope.BuilderScope]
template BuilderScopeGidBuilderT()
{
}
