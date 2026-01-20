/// Module for [Expression] class
module gtk.expression;

import gid.gid;
import gobject.object;
import gobject.types;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression_watch;
import gtk.types;

/**
    [gtk.expression.Expression] provides a way to describe references to values.
    
    An important aspect of expressions is that the value can be obtained
    from a source that is several steps away. For example, an expression
    may describe ‘the value of property A of `object1`, which is itself the
    value of a property of `object2`’. And `object1` may not even exist yet
    at the time that the expression is created. This is contrast to [gobject.object.ObjectWrap]
    property bindings, which can only create direct connections between
    the properties of two objects that must both exist for the duration
    of the binding.
    
    An expression needs to be "evaluated" to obtain the value that it currently
    refers to. An evaluation always happens in the context of a current object
    called `this` (it mirrors the behavior of object-oriented languages),
    which may or may not influence the result of the evaluation. Use
    [gtk.expression.Expression.evaluate] for evaluating an expression.
    
    Various methods for defining expressions exist, from simple constants via
    [gtk.constant_expression.ConstantExpression.new_] to looking up properties in a [gobject.object.ObjectWrap]
    (even recursively) via [gtk.property_expression.PropertyExpression.new_] or providing
    custom functions to transform and combine expressions via
    [gtk.closure_expression.ClosureExpression.new_].
    
    Here is an example of a complex expression:
    
    ```c
      color_expr = gtk_property_expression_new (GTK_TYPE_LIST_ITEM,
                                                NULL, "item");
      expression = gtk_property_expression_new (GTK_TYPE_COLOR,
                                                color_expr, "name");
    ```
    
    when evaluated with `this` being a [gtk.list_item.ListItem], it will obtain the
    "item" property from the [gtk.list_item.ListItem], and then obtain the "name" property
    from the resulting object (which is assumed to be of type `GTK_TYPE_COLOR`).
    
    A more concise way to describe this would be
    
    ```
      this->item->name
    ```
    
    The most likely place where you will encounter expressions is in the context
    of list models and list widgets using them. For example, [gtk.drop_down.DropDown] is
    evaluating a [gtk.expression.Expression] to obtain strings from the items in its model
    that it can then use to match against the contents of its search entry.
    [gtk.string_filter.StringFilter] is using a [gtk.expression.Expression] for similar reasons.
    
    By default, expressions are not paying attention to changes and evaluation is
    just a snapshot of the current state at a given time. To get informed about
    changes, an expression needs to be "watched" via a [gtk.expression_watch.ExpressionWatch],
    which will cause a callback to be called whenever the value of the expression may
    have changed; [gtk.expression.Expression.watch] starts watching an expression, and
    [gtk.expression_watch.ExpressionWatch.unwatch] stops.
    
    Watches can be created for automatically updating the property of an object,
    similar to GObject's [gobject.binding.Binding] mechanism, by using [gtk.expression.Expression.bind].
    
    ## GtkExpression in GObject properties
    
    In order to use a [gtk.expression.Expression] as a [gobject.object.ObjectWrap] property, you must use the
    `func@Gtk.param_spec_expression` when creating a [gobject.param_spec.ParamSpec] to install in the
    [gobject.object.ObjectWrap] class being defined; for instance:
    
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
    stored [gtk.expression.Expression] from the [gobject.value.Value] container, and `func@Gtk.value_set_expression`,
    to store the [gtk.expression.Expression] into the [gobject.value.Value]; for instance:
    
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
    
    [gtk.builder.Builder] has support for creating expressions. The syntax here can be used where
    a [gtk.expression.Expression] object is needed like in a `<property>` tag for an expression
    property, or in a `<binding name="property">` tag to bind a property to an expression.
    
    To create a property expression, use the `<lookup>` element. It can have a `type`
    attribute to specify the object type, and a `name` attribute to specify the property
    to look up. The content of `<lookup>` can either be an element specifying the expression
    to use the object, or a string that specifies the name of the object to use.
    
    Example:
    
    ```xml
      <lookup name='search'>string_filter</lookup>
    ```
    
    Since the `<lookup>` element creates an expression and its element content can
    itself be an expression, this means that `<lookup>` tags can also be nested.
    This is a common idiom when dealing with [gtk.list_item.ListItem]s. See
    [gtk.builder_list_item_factory.BuilderListItemFactory] for an example of this technique.
    
    To create a constant expression, use the `<constant>` element. If the type attribute
    is specified, the element content is interpreted as a value of that type. Otherwise,
    it is assumed to be an object. For instance:
    
    ```xml
      <constant>string_filter</constant>
      <constant type='gchararray'>Hello, world</constant>
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
    
    To create a property binding, use the `<binding>` element in place of where a
    `<property>` tag would ordinarily be used. The `name` and `object` attributes are
    supported. The `name` attribute is required, and pertains to the applicable property
    name. The `object` attribute is optional. If provided, it will use the specified object
    as the `this` object when the expression is evaluated. Here is an example in which the
    `label` property of a [gtk.label.Label] is bound to the `string` property of another arbitrary
    object:
    
    ```xml
      <object class='GtkLabel'>
        <binding name='label'>
          <lookup name='string'>some_other_object</lookup>
        </binding>
      </object>
    ```
*/
class Expression
{
  GtkExpression* _cInstancePtr;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.expression.Expression");

    _cInstancePtr = cast(GtkExpression*)ptr;

    if (!take)
      gtk_expression_ref(_cInstancePtr);
  }

  ~this()
  {
    gtk_expression_unref(_cInstancePtr);
  }


  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    if (dup)
      gtk_expression_ref(_cInstancePtr);

    return _cInstancePtr;
  }

  /**
      Bind `target`'s property named `property` to `self`.
      
      The value that `self` evaluates to is set via `[gobject.object.ObjectWrap.set]` on
      `target`. This is repeated whenever `self` changes to ensure that
      the object's property stays synchronized with `self`.
      
      If `self`'s evaluation fails, `target`'s `property` is not updated.
      You can ensure that this doesn't happen by using a fallback
      expression.
      
      Note that this function takes ownership of `self`. If you want
      to keep it around, you should [gtk.expression.Expression.ref_] it beforehand.
  
      Params:
        target = the target object to bind to
        property = name of the property on `target` to bind to
        this_ = the this argument for
            the evaluation of `self`
      Returns: a [gtk.expression_watch.ExpressionWatch]
  */
  gtk.expression_watch.ExpressionWatch bind(gobject.object.ObjectWrap target, string property, gobject.object.ObjectWrap this_ = null)
  {
    GtkExpressionWatch* _cretval;
    const(char)* _property = property.toCString(No.Alloc);
    _cretval = gtk_expression_bind(cast(GtkExpression*)this._cPtr, target ? cast(GObject*)target._cPtr(No.Dup) : null, _property, this_ ? cast(GObject*)this_._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.expression_watch.ExpressionWatch(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Evaluates the given expression and on success stores the result
      in value.
      
      The [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] of `value` will be the type given by
      [gtk.expression.Expression.getValueType].
      
      It is possible that expressions cannot be evaluated - for example
      when the expression references objects that have been destroyed or
      set to `NULL`. In that case `value` will remain empty and `FALSE`
      will be returned.
  
      Params:
        this_ = the this argument for the evaluation
        value = an empty [gobject.value.Value]
      Returns: `TRUE` if the expression could be evaluated
  */
  bool evaluate(gobject.object.ObjectWrap this_, gobject.value.Value value)
  {
    bool _retval;
    _retval = cast(bool)gtk_expression_evaluate(cast(GtkExpression*)this._cPtr, this_ ? cast(GObject*)this_._cPtr(No.Dup) : null, value ? cast(GValue*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] that this expression evaluates to.
      
      This type is constant and will not change over the lifetime
      of this expression.
      Returns: The type returned from [gtk.expression.Expression.evaluate]
  */
  gobject.types.GType getValueType()
  {
    gobject.types.GType _retval;
    _retval = gtk_expression_get_value_type(cast(GtkExpression*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the expression is static.
      
      A static expression will never change its result when
      [gtk.expression.Expression.evaluate] is called on it with the same arguments.
      
      That means a call to [gtk.expression.Expression.watch] is not necessary because
      it will never trigger a notify.
      Returns: `TRUE` if the expression is static
  */
  bool isStatic()
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
          [gtk.expression_watch.ExpressionWatch.unwatch]. You should call [gtk.expression_watch.ExpressionWatch.ref_]
          if you want to keep the watch around.
  */
  gtk.expression_watch.ExpressionWatch watch(gobject.object.ObjectWrap this_, gtk.types.ExpressionNotify notify)
  {
    extern(C) void _notifyCallback(void* userData)
    {
      auto _dlg = cast(gtk.types.ExpressionNotify*)userData;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GtkExpressionWatch* _cretval;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    GDestroyNotify _notifyDestroyCB = notify ? &thawDelegate : null;
    _cretval = gtk_expression_watch(cast(GtkExpression*)this._cPtr, this_ ? cast(GObject*)this_._cPtr(No.Dup) : null, _notifyCB, _notify, _notifyDestroyCB);
    auto _retval = _cretval ? new gtk.expression_watch.ExpressionWatch(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
