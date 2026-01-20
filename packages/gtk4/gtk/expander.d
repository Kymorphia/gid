/// Module for [Expander] class
module gtk.expander;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.expander.Expander] allows the user to reveal its child by clicking
    on an expander triangle.
    
    ![An example GtkExpander](expander.png)
    
    This is similar to the triangles used in a [gtk.tree_view.TreeView].
    
    Normally you use an expander as you would use a frame; you create
    the child widget and use [gtk.expander.Expander.setChild] to add it
    to the expander. When the expander is toggled, it will take care of
    showing and hiding the child automatically.
    
    # Special Usage
    
    There are situations in which you may prefer to show and hide the
    expanded widget yourself, such as when you want to actually create
    the widget at expansion time. In this case, create a [gtk.expander.Expander]
    but do not add a child to it. The expander widget has an
    [gtk.expander.Expander.expanded] property which can be used to
    monitor its expansion state. You should watch this property with
    a signal connection as follows:
    
    ```c
    static void
    expander_callback (GObject    *object,
                       GParamSpec *param_spec,
                       gpointer    user_data)
    {
      GtkExpander *expander;
    
      expander = GTK_EXPANDER (object);
    
      if (gtk_expander_get_expanded (expander))
        {
          // Show or create widgets
        }
      else
        {
          // Hide or destroy widgets
        }
    }
    
    static void
    create_expander (void)
    {
      GtkWidget *expander = gtk_expander_new_with_mnemonic ("_More Options");
      g_signal_connect (expander, "notify::expanded",
                        G_CALLBACK (expander_callback), NULL);
    
      // ...
    }
    ```
    
    # GtkExpander as GtkBuildable
    
    The [gtk.expander.Expander] implementation of the [gtk.buildable.Buildable] interface supports
    placing a child in the label position by specifying “label” as the
    “type” attribute of a `<child>` element. A normal content child can be
    specified without specifying a `<child>` type attribute.
    
    An example of a UI definition fragment with GtkExpander:
    
    ```xml
    <object class="GtkExpander">
      <child type="label">
        <object class="GtkLabel" id="expander-label"/>
      </child>
      <child>
        <object class="GtkEntry" id="expander-content"/>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```
    expander-widget
    ╰── box
        ├── title
        │   ├── expander
        │   ╰── <label widget>
        ╰── <child>
    ```
    
    [gtk.expander.Expander] has a main node `expander-widget`, and subnode `box` containing
    the title and child widget. The box subnode `title` contains node `expander`,
    i.e. the expand/collapse arrow; then the label widget if any. The arrow of an
    expander that is showing its child gets the `:checked` pseudoclass set on it.
    
    # Accessibility
    
    [gtk.expander.Expander] uses the [gtk.types.AccessibleRole.Button] role.
*/
class Expander : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_expander_get_type != &gidSymbolNotFound ? gtk_expander_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Expander self()
  {
    return this;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `expanded` property.
      Returns: Whether the expander has been opened to reveal the child.
  */
  @property bool expanded()
  {
    return getExpanded();
  }

  /**
      Set `expanded` property.
      Params:
        propval = Whether the expander has been opened to reveal the child.
  */
  @property void expanded(bool propval)
  {
    return setExpanded(propval);
  }

  /**
      Get `label` property.
      Returns: The text of the expanders label.
  */
  @property string label()
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The text of the expanders label.
  */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /**
      Get `labelWidget` property.
      Returns: A widget to display instead of the usual expander label.
  */
  @property gtk.widget.Widget labelWidget()
  {
    return getLabelWidget();
  }

  /**
      Set `labelWidget` property.
      Params:
        propval = A widget to display instead of the usual expander label.
  */
  @property void labelWidget(gtk.widget.Widget propval)
  {
    return setLabelWidget(propval);
  }

  /**
      Get `resizeToplevel` property.
      Returns: When this property is true, the expander will resize the toplevel
        widget containing the expander upon expanding and collapsing.
  */
  @property bool resizeToplevel()
  {
    return getResizeToplevel();
  }

  /**
      Set `resizeToplevel` property.
      Params:
        propval = When this property is true, the expander will resize the toplevel
          widget containing the expander upon expanding and collapsing.
  */
  @property void resizeToplevel(bool propval)
  {
    return setResizeToplevel(propval);
  }

  /**
      Get `useMarkup` property.
      Returns: Whether the text in the label is Pango markup.
  */
  @property bool useMarkup()
  {
    return getUseMarkup();
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = Whether the text in the label is Pango markup.
  */
  @property void useMarkup(bool propval)
  {
    return setUseMarkup(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: Whether an underline in the text indicates a mnemonic.
  */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an underline in the text indicates a mnemonic.
  */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  /**
      Creates a new expander using label as the text of the label.
  
      Params:
        label = the text of the label
      Returns: a new [gtk.expander.Expander] widget.
  */
  this(string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_expander_new(_label);
    this(_cretval, No.Take);
  }

  /**
      Creates a new expander using label as the text of the label.
      
      If characters in label are preceded by an underscore, they are
      underlined. If you need a literal underscore character in a label,
      use “__” (two underscores). The first underlined character represents
      a keyboard accelerator called a mnemonic.
      
      Pressing Alt and that key activates the button.
  
      Params:
        label = the text of the label with an underscore
            in front of the mnemonic character
      Returns: a new [gtk.expander.Expander] widget.
  */
  static gtk.expander.Expander newWithMnemonic(string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_expander_new_with_mnemonic(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.expander.Expander)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the child widget of expander.
      Returns: the child widget of expander
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_expander_get_child(cast(GtkExpander*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries a [gtk.expander.Expander] and returns its current state.
      
      Returns true if the child widget is revealed.
      Returns: the current state of the expander
  */
  bool getExpanded()
  {
    bool _retval;
    _retval = cast(bool)gtk_expander_get_expanded(cast(GtkExpander*)this._cPtr);
    return _retval;
  }

  /**
      Fetches the text from a label widget.
      
      This is including any embedded underlines indicating mnemonics and
      Pango markup, as set by [gtk.expander.Expander.setLabel]. If the label
      text has not been set the return value will be null. This will be the
      case if you create an empty button with [gtk.button.Button.new_] to use as a
      container.
      Returns: The text of the label widget. This string is owned
          by the widget and must not be modified or freed.
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_expander_get_label(cast(GtkExpander*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the label widget for the frame.
      Returns: the label widget
  */
  gtk.widget.Widget getLabelWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_expander_get_label_widget(cast(GtkExpander*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the expander will resize the toplevel widget
      containing the expander upon resizing and collapsing.
      Returns: the “resize toplevel” setting.
  */
  bool getResizeToplevel()
  {
    bool _retval;
    _retval = cast(bool)gtk_expander_get_resize_toplevel(cast(GtkExpander*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the label’s text is interpreted as Pango markup.
      Returns: true if the label’s text will be parsed for markup
  */
  bool getUseMarkup()
  {
    bool _retval;
    _retval = cast(bool)gtk_expander_get_use_markup(cast(GtkExpander*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether an underline in the text indicates a mnemonic.
      Returns: true if an embedded underline in the expander
          label indicates the mnemonic accelerator keys
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = cast(bool)gtk_expander_get_use_underline(cast(GtkExpander*)this._cPtr);
    return _retval;
  }

  /**
      Sets the child widget of expander.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_expander_set_child(cast(GtkExpander*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the state of the expander.
      
      Set to true, if you want the child widget to be revealed,
      and false if you want the child widget to be hidden.
  
      Params:
        expanded = whether the child widget is revealed
  */
  void setExpanded(bool expanded)
  {
    gtk_expander_set_expanded(cast(GtkExpander*)this._cPtr, expanded);
  }

  /**
      Sets the text of the label of the expander to label.
      
      This will also clear any previously set labels.
  
      Params:
        label = a string
  */
  void setLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_expander_set_label(cast(GtkExpander*)this._cPtr, _label);
  }

  /**
      Set the label widget for the expander.
      
      This is the widget that will appear embedded alongside
      the expander arrow.
  
      Params:
        labelWidget = the new label widget
  */
  void setLabelWidget(gtk.widget.Widget labelWidget = null)
  {
    gtk_expander_set_label_widget(cast(GtkExpander*)this._cPtr, labelWidget ? cast(GtkWidget*)labelWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the expander will resize the toplevel widget
      containing the expander upon resizing and collapsing.
  
      Params:
        resizeToplevel = whether to resize the toplevel
  */
  void setResizeToplevel(bool resizeToplevel)
  {
    gtk_expander_set_resize_toplevel(cast(GtkExpander*)this._cPtr, resizeToplevel);
  }

  /**
      Sets whether the text of the label contains Pango markup.
  
      Params:
        useMarkup = true if the label’s text should be parsed for markup
  */
  void setUseMarkup(bool useMarkup)
  {
    gtk_expander_set_use_markup(cast(GtkExpander*)this._cPtr, useMarkup);
  }

  /**
      If true, an underline in the text indicates a mnemonic.
  
      Params:
        useUnderline = true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool useUnderline)
  {
    gtk_expander_set_use_underline(cast(GtkExpander*)this._cPtr, useUnderline);
  }

  /**
      Connect to `Activate` signal.
  
      Activates the [gtk.expander.Expander].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.expander.Expander expander))
  
          `expander` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.expander.Expander)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
