/// Module for [Expression] class
module gid.gtk4.expression;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gobject2.value;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.expression_watch;
import gid.gtk4.types;

/**
    Provides a way to describe references to values.
    
    An important aspect of expressions is that the value can be obtained
    from a source that is several steps away. For example, an expression
    may describe ‘the value of property A of `object1`, which is itself the
    value of a property of `object2`’. And `object1` may not even exist yet
    at the time that the expression is created. This is contrast to [gid.gobject2.object.ObjectWrap]
    property bindings, which can only create direct connections between
    the properties of two objects that must both exist for the duration
    of the binding.
    
    An expression needs to be "evaluated" to obtain the value that it currently
    refers to. An evaluation always happens in the context of a current object
    called `this` (it mirrors the behavior of object-oriented languages),
    which may or may not influence the result of the evaluation. Use
    [gid.gtk4.expression.Expression.evaluate] for evaluating an expression.
    
    Various methods for defining expressions exist, from simple constants via
    [gid.gtk4.constant_expression.ConstantExpression.new_] to looking up properties in a [gid.gobject2.object.ObjectWrap]
    (even recursively) via [gid.gtk4.property_expression.PropertyExpression.new_] or providing
    custom functions to transform and combine expressions via
    [gid.gtk4.closure_expression.ClosureExpression.new_].
    
    Here is an example of a complex expression:
    
    ```c
      color_expr = gtk_property_expression_new (GTK_TYPE_LIST_ITEM,
                                                NULL, "item");
      expression = gtk_property_expression_new (GTK_TYPE_COLOR,
                                                color_expr, "name");
    ```
    
    when evaluated with `this` being a [gid.gtk4.list_item.ListItem], it will obtain the
    "item" property from the [gid.gtk4.list_item.ListItem], and then obtain the "name" property
    from the resulting object (which is assumed to be of type `GTK_TYPE_COLOR`).
    
    A more concise way to describe this would be
    
    ```
      this->item->name
    ```
    
    The most likely place where you will encounter expressions is in the context
    of list models and list widgets using them. For example, [gid.gtk4.drop_down.DropDown] is
    evaluating a [gid.gtk4.expression.Expression] to obtain strings from the items in its model
    that it can then use to match against the contents of its search entry.
    [gid.gtk4.string_filter.StringFilter] is using a [gid.gtk4.expression.Expression] for similar reasons.
    
    By default, expressions are not paying attention to changes and evaluation is
    just a snapshot of the current state at a given time. To get informed about
    changes, an expression needs to be "watched" via a [gid.gtk4.expression_watch.ExpressionWatch],
    which will cause a callback to be called whenever the value of the expression may
    have changed; [gid.gtk4.expression.Expression.watch] starts watching an expression, and
    [gid.gtk4.expression_watch.ExpressionWatch.unwatch] stops.
    
    Watches can be created for automatically updating the property of an object,
    similar to GObject's [gid.gobject2.binding.Binding] mechanism, by using [gid.gtk4.expression.Expression.bind].
    
    ## GtkExpression in GObject properties
    
    In order to use a [gid.gtk4.expression.Expression] as a [gid.gobject2.object.ObjectWrap] property, you must use the
    `func@Gtk.param_spec_expression` when creating a [gid.gobject2.param_spec.ParamSpec] to install in the
    [gid.gobject2.object.ObjectWrap] class being defined; for instance:
    
    ```c
    obj_props[PROP_EXPRESSION] =
      gtk_param_spec_expression ("expression",
                                 "Expression",
                                 "The expression used by the widget",
                                 G_PARAM_READWRITE |
                                 G_PARAM_STATIC_STRINGS |
                                 G_PARAM_EXPLICIT_NOTIFY);
    ```
    
    When implementing the `GObjectClass.set_property` and `GObjectClass.get_property`
    virtual functions, you must use `func@Gtk.value_get_expression`, to retrieve the
    stored [gid.gtk4.expression.Expression] from the [gid.gobject2.value.Value] container, and `func@Gtk.value_set_expression`,
    to store the [gid.gtk4.expression.Expression] into the [gid.gobject2.value.Value]; for instance:
    
    ```c
      // in set_property()...
      case PROP_EXPRESSION:
        foo_widget_set_expression (foo, gtk_value_get_expression (value));
        break;
    
      // in get_property()...
      case PROP_EXPRESSION:
        gtk_value_set_expression (value, foo->expression);
        break;
    ```
    
    ## GtkExpression in .ui files
    
    [gid.gtk4.builder.Builder] has support for creating expressions. The syntax here can be used where
    a [gid.gtk4.expression.Expression] object is needed like in a `<property>` tag for an expression
    property, or in a `<binding name="property">` tag to bind a property to an expression.
    
    To create a property expression, use the `<lookup>` element. It can have a `type`
    attribute to specify the object type, and a `name` attribute to specify the property
    to look up. The content of `<lookup>` can either be a string that specifies the name
    of the object to use, an element specifying an expression to provide an object, or
    empty to use the `this` object.
    
    Example:
    
    ```xml
      <lookup name='search'>string_filter</lookup>
    ```
    
    Since the `<lookup>` element creates an expression and its element content can
    itself be an expression, this means that `<lookup>` tags can also be nested.
    This is a common idiom when dealing with [gid.gtk4.list_item.ListItem]s. See
    [gid.gtk4.builder_list_item_factory.BuilderListItemFactory] for an example of this technique.
    
    To create a constant expression, use the `<constant>` element. If the type attribute
    is specified, the element content is interpreted as a value of that type, and the
    initial attribute can be specified to get the initial value for that type. Otherwise,
    it is assumed to be an object. For instance:
    
    ```xml
      <constant>string_filter</constant>
      <constant type='gchararray'>Hello, world</constant>
      <constant type='gchararray' initial='true' /> <!-- NULL -->
    ```
    
    String (`type='gchararray'`) constants can be marked for translation with the
    `translatable=` attribute, and will then be looked up in the
    [gid.gtk4.builder.Builder.translationDomain] when the expression is constructed.
    
    ```xml
      <constant type='gchararray' translatable='yes'>I'm translatable!</constant>
    ```
    
    As with other translatable strings in [gid.gtk4.builder.Builder], constants can
    also have a context and/or translation comment:
    
    ```xml
      <constant type='gchararray'
                translatable='yes'
                context='example'
                comments='A sample string'>I'm translatable!</constant>
    ```
    
    To create a closure expression, use the `<closure>` element. The `function`
    attribute specifies what function to use for the closure, and the `type`
    attribute specifies its return type. The content of the element contains the
    expressions for the parameters. For instance:
    
    ```xml
      <closure type='gchararray' function='combine_args_somehow'>
        <constant type='gchararray'>File size:</constant>
        <lookup type='GFile' name='size'>myfile</lookup>
      </closure>
    ```
    
    If an expression can fail, a `<try>` element can be used to provide fallbacks.
    The expressions are tried from top to bottom until one of them succeeds.
    If none of the expressions succeed, the expression fails as normal:
    
    ```xml
      <try>
        <lookup type='GtkWindow' name='title'>
          <lookup type='GtkLabel' name='root'></lookup>
        </lookup>
        <constant type='gchararray'>Hello World</constant>
      </try>
    ```
    
    To create a property binding, use the `<binding>` element in place of where a
    `<property>` tag would ordinarily be used. The `name` and `object` attributes are
    supported. The `name` attribute is required, and pertains to the applicable property
    name. The `object` attribute is optional. If provided, it will use the specified object
    as the `this` object when the expression is evaluated. Here is an example in which the
    `label` property of a [gid.gtk4.label.Label] is bound to the `string` property of another arbitrary
    object:
    
    ```xml
      <object class='GtkLabel'>
        <binding name='label'>
          <lookup name='string'>some_other_object</lookup>
        </binding>
      </object>
    ```
*/
class Expression : ReffedWrap!(GtkExpression*, gtk_expression_ref, gtk_expression_unref)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_expression_get_type != &gidSymbolNotFound ? gtk_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Bind `target`'s property named `property` to `self`.
      
      The value that `self` evaluates to is set via `[gid.gobject2.object.ObjectWrap.set]` on
      `target`. This is repeated whenever `self` changes to ensure that
      the object's property stays synchronized with `self`.
      
      If `self`'s evaluation fails, `target`'s `property` is not updated.
      Use a [gid.gtk4.try_expression.TryExpression] to provide a fallback for this case.
      
      Note that this function takes ownership of `self`. If you want
      to keep it around, you should [gid.gtk4.expression.Expression.ref_] it beforehand.
  
      Params:
        target = the target object to bind to
        property = name of the property on `target` to bind to
        this_ = the this argument for
            the evaluation of `self`
      Returns: a [gid.gtk4.expression_watch.ExpressionWatch]
  */
  gid.gtk4.expression_watch.ExpressionWatch bind(gid.gobject2.object.ObjectWrap target, string property, gid.gobject2.object.ObjectWrap this_ = null) nothrow
  {
    GtkExpressionWatch* _cretval;
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_expression_bind(cast(GtkExpression*)this._cPtr(Yes.Dup), target ? cast(GObject*)target._cPtr(No.Dup) : null, _property, this_ ? cast(GObject*)this_._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gtk4.expression_watch.ExpressionWatch(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Evaluates the given expression and on success stores the result
      in value.
      
      The `GType` of `value` will be the type given by
      [gid.gtk4.expression.Expression.getValueType].
      
      It is possible that expressions cannot be evaluated - for example
      when the expression references objects that have been destroyed or
      set to `NULL`. In that case `value` will remain empty and `FALSE`
      will be returned.
  
      Params:
        this_ = the this argument for the evaluation
        value = an empty [gid.gobject2.value.Value]
      Returns: `TRUE` if the expression could be evaluated
  */
  bool evaluate(gid.gobject2.object.ObjectWrap this_, gid.gobject2.value.Value value) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_expression_evaluate(cast(GtkExpression*)this._cPtr, this_ ? cast(GObject*)this_._cPtr(No.Dup) : null, value ? cast(GValue*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the `GType` that this expression evaluates to.
      
      This type is constant and will not change over the lifetime
      of this expression.
      Returns: The type returned from [gid.gtk4.expression.Expression.evaluate]
  */
  gid.gobject2.types.GType getValueType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = gtk_expression_get_value_type(cast(GtkExpression*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the expression is static.
      
      A static expression will never change its result when
      [gid.gtk4.expression.Expression.evaluate] is called on it with the same arguments.
      
      That means a call to [gid.gtk4.expression.Expression.watch] is not necessary because
      it will never trigger a notify.
      Returns: `TRUE` if the expression is static
  */
  bool isStatic() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_expression_is_static(cast(GtkExpression*)this._cPtr);
    return _retval;
  }

  /**
      Watch the given `expression` for changes.
      
      The notify function will be called whenever the evaluation of `self`
      may have changed.
      
      GTK cannot guarantee that the evaluation did indeed change when the notify
      gets invoked, but it guarantees the opposite: When it did in fact change,
      the notify will be invoked.
  
      Params:
        this_ = the `this` argument to
            watch
        notify = callback to invoke when the expression changes
      Returns: The newly installed watch. Note that the only
          reference held to the watch will be released when the watch is unwatched
          which can happen automatically, and not just via
          [gid.gtk4.expression_watch.ExpressionWatch.unwatch]. You should call [gid.gtk4.expression_watch.ExpressionWatch.ref_]
          if you want to keep the watch around.
  */
  gid.gtk4.expression_watch.ExpressionWatch watch(gid.gobject2.object.ObjectWrap this_, gid.gtk4.types.ExpressionNotify notify) nothrow
  {
    extern(C) void _notifyCallback(void* userData) nothrow
    {
      auto _dlg = cast(gid.gtk4.types.ExpressionNotify*)userData;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.ExpressionNotify");
      }
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GtkExpressionWatch* _cretval;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    GDestroyNotify _notifyDestroyCB = notify ? &thawDelegate : null;
    _cretval = gtk_expression_watch(cast(GtkExpression*)this._cPtr, this_ ? cast(GObject*)this_._cPtr(No.Dup) : null, _notifyCB, _notify, _notifyDestroyCB);
    auto _retval = _cretval ? new gid.gtk4.expression_watch.ExpressionWatch(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
