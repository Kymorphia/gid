/// Module for [Banner] class
module adw.banner;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A bar with contextual information.
    
    <picture>
      <source srcset="banner-dark.png" media="(prefers-color-scheme: dark)">
      <img src="banner.png" alt="banner">
    </picture>
    
    Banners are hidden by default, use [adw.banner.Banner.revealed] to show them.
    
    Banners have a title, set with [adw.banner.Banner.title]. Titles can be marked
    up with Pango markup, use [adw.banner.Banner.useMarkup] to enable it.
    
    The title will be shown centered or left-aligned depending on available
    space.
    
    Banners can optionally have a button with text on it, set through
    [adw.banner.Banner.buttonLabel]. The button can be used with a [gio.action.Action],
    or with the [adw.banner.Banner.buttonClicked] signal.
    
    ## CSS nodes
    
    [adw.banner.Banner] has a main CSS node with the name `banner`.
*/
class Banner : gtk.widget.Widget, gtk.actionable.Actionable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_banner_get_type != &gidSymbolNotFound ? adw_banner_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Banner self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.banner.Banner]
      Returns: New builder object
  */
  static BannerGidBuilder builder() nothrow
  {
    return new BannerGidBuilder;
  }

  /**
      Get `buttonLabel` property.
      Returns: The label to show on the button.
        
        If set to `""` or `NULL`, the button won't be shown.
        
        The button can be used with a [gio.action.Action], or with the
        [adw.banner.Banner.buttonClicked] signal.
  */
  @property string buttonLabel() nothrow
  {
    return getButtonLabel();
  }

  /**
      Set `buttonLabel` property.
      Params:
        propval = The label to show on the button.
          
          If set to `""` or `NULL`, the button won't be shown.
          
          The button can be used with a [gio.action.Action], or with the
          [adw.banner.Banner.buttonClicked] signal.
  */
  @property void buttonLabel(string propval) nothrow
  {
    setButtonLabel(propval);
  }

  /**
      Get `revealed` property.
      Returns: Whether the banner is currently revealed.
  */
  @property bool revealed() nothrow
  {
    return getRevealed();
  }

  /**
      Set `revealed` property.
      Params:
        propval = Whether the banner is currently revealed.
  */
  @property void revealed(bool propval) nothrow
  {
    setRevealed(propval);
  }

  /**
      Get `title` property.
      Returns: The title for this banner.
        
        See also: [adw.banner.Banner.useMarkup].
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this banner.
          
          See also: [adw.banner.Banner.useMarkup].
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Get `useMarkup` property.
      Returns: Whether to use Pango markup for the banner title.
        
        See also `func@Pango.parse_markup`.
  */
  @property bool useMarkup() nothrow
  {
    return getUseMarkup();
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = Whether to use Pango markup for the banner title.
          
          See also `func@Pango.parse_markup`.
  */
  @property void useMarkup(bool propval) nothrow
  {
    setUseMarkup(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new [adw.banner.Banner].
  
      Params:
        title = the banner title
      Returns: the newly created [adw.banner.Banner]
  */
  this(string title) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = adw_banner_new(_title);
    this(_cretval, No.Take);
  }

  /**
      Gets the button label for self.
      Returns: the button label for self
  */
  string getButtonLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_banner_get_button_label(cast(AdwBanner*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets if a banner is revealed
      Returns: Whether a banner is revealed
  */
  bool getRevealed() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_banner_get_revealed(cast(AdwBanner*)this._cPtr);
    return _retval;
  }

  /**
      Gets the title for self.
      Returns: the title for self
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_banner_get_title(cast(AdwBanner*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether to use Pango markup for the banner title.
      Returns: whether to use markup
  */
  bool getUseMarkup() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_banner_get_use_markup(cast(AdwBanner*)this._cPtr);
    return _retval;
  }

  /**
      Sets the button label for self.
      
      If set to `""` or `NULL`, the button won't be shown.
      
      The button can be used with a [gio.action.Action], or with the
      [adw.banner.Banner.buttonClicked] signal.
  
      Params:
        label = the label
  */
  void setButtonLabel(string label = null) nothrow
  {
    const(char)* _label = label.toCString(No.Alloc);
    adw_banner_set_button_label(cast(AdwBanner*)this._cPtr, _label);
  }

  /**
      Sets whether a banner should be revealed
  
      Params:
        revealed = whether a banner should be revealed
  */
  void setRevealed(bool revealed) nothrow
  {
    adw_banner_set_revealed(cast(AdwBanner*)this._cPtr, revealed);
  }

  /**
      Sets the title for this banner.
      
      See also: [adw.banner.Banner.useMarkup].
  
      Params:
        title = the title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_banner_set_title(cast(AdwBanner*)this._cPtr, _title);
  }

  /**
      Sets whether to use Pango markup for the banner title.
      
      See also `funcPango.parse_markup`.
  
      Params:
        useMarkup = whether to use markup
  */
  void setUseMarkup(bool useMarkup) nothrow
  {
    adw_banner_set_use_markup(cast(AdwBanner*)this._cPtr, useMarkup);
  }

  /**
      Connect to `ButtonClicked` signal.
  
      This signal is emitted after the action button has been clicked.
        
        It can be used as an alternative to setting an action.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(adw.banner.Banner banner)`
  
          `banner` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectButtonClicked(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.banner.Banner)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "adw.banner.Banner.buttonClicked");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("button-clicked", closure, after);
  }
}

/// Fluent builder implementation template for [adw.banner.Banner]
class BannerGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.actionable.ActionableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();

  /**
      Set `buttonLabel` property.
      Params:
        propval = The label to show on the button.
          
          If set to `""` or `NULL`, the button won't be shown.
          
          The button can be used with a [gio.action.Action], or with the
          [adw.banner.Banner.buttonClicked] signal.
      Returns: Builder instance for fluent chaining
  */
  T buttonLabel(string propval) nothrow
  {
    return setProperty("button-label", propval);
  }

  /**
      Set `revealed` property.
      Params:
        propval = Whether the banner is currently revealed.
      Returns: Builder instance for fluent chaining
  */
  T revealed(bool propval) nothrow
  {
    return setProperty("revealed", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this banner.
          
          See also: [adw.banner.Banner.useMarkup].
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = Whether to use Pango markup for the banner title.
          
          See also `func@Pango.parse_markup`.
      Returns: Builder instance for fluent chaining
  */
  T useMarkup(bool propval) nothrow
  {
    return setProperty("use-markup", propval);
  }
}

/// Fluent builder for [adw.banner.Banner]
final class BannerGidBuilder : BannerGidBuilderImpl!BannerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Banner build() nothrow
  {
    return new Banner(cast(void*)createGObject(Banner._getGType), No.Take);
  }
}
