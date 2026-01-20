/// Module for [Expander] class
module gtk.expander;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    A #GtkExpander allows the user to hide or show its child by clicking
    on an expander triangle similar to the triangles used in a #GtkTreeView.
    
    Normally you use an expander as you would use any other descendant
    of #GtkBin; you create the child widget and use [gtk.container.Container.add]
    to add it to the expander. When the expander is toggled, it will take
    care of showing and hiding the child automatically.
    
    # Special Usage
    
    There are situations in which you may prefer to show and hide the
    expanded widget yourself, such as when you want to actually create
    the widget at expansion time. In this case, create a #GtkExpander
    but do not add a child to it. The expander widget has an
    #GtkExpander:expanded property which can be used to monitor
    its expansion state. You should watch this property with a signal
    connection as follows:
    
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
    
    The GtkExpander implementation of the GtkBuildable interface supports
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
    
    ```plain
    expander
    ├── title
    │   ├── arrow
    │   ╰── <label widget>
    ╰── <child>
    ```
    
    GtkExpander has three CSS nodes, the main node with the name expander,
    a subnode with name title and node below it with name arrow. The arrow of an
    expander that is showing its child gets the :checked pseudoclass added to it.
*/
class Expander : gtk.bin.Bin
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

  /** */
  @property bool expanded()
  {
    return getExpanded();
  }

  /** */
  @property void expanded(bool propval)
  {
    return setExpanded(propval);
  }

  /** */
  @property string label()
  {
    return getLabel();
  }

  /** */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /**
      Get `labelFill` property.
      Returns: Whether the label widget should fill all available horizontal space.
        
        Note that this property is ignored since 3.20.
  */
  @property bool labelFill()
  {
    return getLabelFill();
  }

  /**
      Set `labelFill` property.
      Params:
        propval = Whether the label widget should fill all available horizontal space.
          
          Note that this property is ignored since 3.20.
  */
  @property void labelFill(bool propval)
  {
    return setLabelFill(propval);
  }

  /** */
  @property gtk.widget.Widget labelWidget()
  {
    return getLabelWidget();
  }

  /** */
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
      Get `spacing` property.
      Returns: Space to put between the label and the child when the
        expander is expanded.
  
      Deprecated: This property is deprecated and ignored.
            Use margins on the child instead.
  */
  @property int spacing()
  {
    return getSpacing();
  }

  /**
      Set `spacing` property.
      Params:
        propval = Space to put between the label and the child when the
          expander is expanded.
  
      Deprecated: This property is deprecated and ignored.
            Use margins on the child instead.
  */
  @property void spacing(int propval)
  {
    return setSpacing(propval);
  }

  /** */
  @property bool useMarkup()
  {
    return getUseMarkup();
  }

  /** */
  @property void useMarkup(bool propval)
  {
    return setUseMarkup(propval);
  }

  /** */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /** */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  /**
      Creates a new expander using label as the text of the label.
  
      Params:
        label = the text of the label
      Returns: a new #GtkExpander widget.
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
      If characters in label are preceded by an underscore, they are underlined.
      If you need a literal underscore character in a label, use “__” (two
      underscores). The first underlined character represents a keyboard
      accelerator called a mnemonic.
      Pressing Alt and that key activates the button.
  
      Params:
        label = the text of the label with an underscore
              in front of the mnemonic character
      Returns: a new #GtkExpander widget.
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
      Queries a #GtkExpander and returns its current state. Returns true
      if the child widget is revealed.
      
      See [gtk.expander.Expander.setExpanded].
      Returns: the current state of the expander
  */
  bool getExpanded()
  {
    bool _retval;
    _retval = cast(bool)gtk_expander_get_expanded(cast(GtkExpander*)this._cPtr);
    return _retval;
  }

  /**
      Fetches the text from a label widget including any embedded
      underlines indicating mnemonics and Pango markup, as set by
      [gtk.expander.Expander.setLabel]. If the label text has not been set the
      return value will be null. This will be the case if you create an
      empty button with [gtk.button.Button.new_] to use as a container.
      
      Note that this function behaved differently in versions prior to
      2.14 and used to return the label text stripped of embedded
      underlines indicating mnemonics and Pango markup. This problem can
      be avoided by fetching the label text directly from the label
      widget.
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
      Returns whether the label widget will fill all available
      horizontal space allocated to expander.
      Returns: true if the label widget will fill all
            available horizontal space
  */
  bool getLabelFill()
  {
    bool _retval;
    _retval = cast(bool)gtk_expander_get_label_fill(cast(GtkExpander*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the label widget for the frame. See
      [gtk.expander.Expander.setLabelWidget].
      Returns: the label widget,
            or null if there is none
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
      containing the expander upon resizing and collpasing.
      Returns: the “resize toplevel” setting.
  */
  bool getResizeToplevel()
  {
    bool _retval;
    _retval = cast(bool)gtk_expander_get_resize_toplevel(cast(GtkExpander*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.expander.Expander.setSpacing].
      Returns: spacing between the expander and child
  
      Deprecated: Use margins on the child instead.
  */
  int getSpacing()
  {
    int _retval;
    _retval = gtk_expander_get_spacing(cast(GtkExpander*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the label’s text is interpreted as marked up with
      the [Pango text markup language][PangoMarkupFormat].
      See [gtk.expander.Expander.setUseMarkup].
      Returns: true if the label’s text will be parsed for markup
  */
  bool getUseMarkup()
  {
    bool _retval;
    _retval = cast(bool)gtk_expander_get_use_markup(cast(GtkExpander*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether an embedded underline in the expander label
      indicates a mnemonic. See [gtk.expander.Expander.setUseUnderline].
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
      Sets the state of the expander. Set to true, if you want
      the child widget to be revealed, and false if you want the
      child widget to be hidden.
  
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
      Sets whether the label widget should fill all available
      horizontal space allocated to expander.
      
      Note that this function has no effect since 3.20.
  
      Params:
        labelFill = true if the label should should fill
              all available horizontal space
  */
  void setLabelFill(bool labelFill)
  {
    gtk_expander_set_label_fill(cast(GtkExpander*)this._cPtr, labelFill);
  }

  /**
      Set the label widget for the expander. This is the widget
      that will appear embedded alongside the expander arrow.
  
      Params:
        labelWidget = the new label widget
  */
  void setLabelWidget(gtk.widget.Widget labelWidget = null)
  {
    gtk_expander_set_label_widget(cast(GtkExpander*)this._cPtr, labelWidget ? cast(GtkWidget*)labelWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the expander will resize the toplevel widget
      containing the expander upon resizing and collpasing.
  
      Params:
        resizeToplevel = whether to resize the toplevel
  */
  void setResizeToplevel(bool resizeToplevel)
  {
    gtk_expander_set_resize_toplevel(cast(GtkExpander*)this._cPtr, resizeToplevel);
  }

  /**
      Sets the spacing field of expander, which is the number of
      pixels to place between expander and the child.
  
      Params:
        spacing = distance between the expander and child in pixels
  
      Deprecated: Use margins on the child instead.
  */
  void setSpacing(int spacing)
  {
    gtk_expander_set_spacing(cast(GtkExpander*)this._cPtr, spacing);
  }

  /**
      Sets whether the text of the label contains markup in
      [Pango’s text markup language][PangoMarkupFormat].
      See [gtk.label.Label.setMarkup].
  
      Params:
        useMarkup = true if the label’s text should be parsed for markup
  */
  void setUseMarkup(bool useMarkup)
  {
    gtk_expander_set_use_markup(cast(GtkExpander*)this._cPtr, useMarkup);
  }

  /**
      If true, an underline in the text of the expander label indicates
      the next character should be used for the mnemonic accelerator key.
  
      Params:
        useUnderline = true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool useUnderline)
  {
    gtk_expander_set_use_underline(cast(GtkExpander*)this._cPtr, useUnderline);
  }

  /**
      Connect to `Activate` signal.
  
      
  
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
