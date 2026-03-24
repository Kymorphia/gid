/// Module for [BuilderScope] interface mixin
module gtk.builder_scope_mixin;

public import gtk.builder_scope_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    [gtk.builder_scope.BuilderScope] is an interface to provide language binding support
    to [gtk.builder.Builder].
    
    The goal of [gtk.builder_scope.BuilderScope] is to look up programming-language-specific
    values for strings that are given in a [gtk.builder.Builder] UI file.
    
    The primary intended audience is bindings that want to provide deeper
    integration of [gtk.builder.Builder] into the language.
    
    A [gtk.builder_scope.BuilderScope] instance may be used with multiple [gtk.builder.Builder] objects,
    even at once.
    
    By default, GTK will use its own implementation of [gtk.builder_scope.BuilderScope]
    for the C language which can be created via [gtk.builder_cscope.BuilderCScope.new_].
    
    If you implement [gtk.builder_scope.BuilderScope] for a language binding, you
    may want to (partially) derive from or fall back to a [gtk.builder_cscope.BuilderCScope],
    as that class implements support for automatic lookups from C symbols.
*/
template BuilderScopeT()
{
}

template BuilderScopeGidBuilderT()
{
}
