/// Module for [Inscription] class
module gid.gtk4.inscription;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.accessible_text;
import gid.gtk4.accessible_text_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;
import gid.pango1.attr_list;
import gid.pango1.types;

/**
    Shows text in a predefined area.
    
    You likely want to use [gid.gtk4.label.Label] instead as this widget is intended only
    for a small subset of use cases. The main scenario envisaged is inside lists
    such as [gid.gtk4.column_view.ColumnView].
    
    While a [gid.gtk4.label.Label] sizes itself depending on the text that is displayed,
    [gid.gtk4.inscription.Inscription] is given a size and inscribes the given text into that
    space as well as it can.
    
    Users of this widget should take care to plan behaviour for the common case
    where the text doesn't fit exactly in the allocated space.
    
    ## CSS nodes
    
    [gid.gtk4.inscription.Inscription] has a single CSS node with the name label.
*/
class Inscription : gid.gtk4.widget.Widget, gid.gtk4.accessible_text.AccessibleText
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
    return cast(void function())gtk_inscription_get_type != &gidSymbolNotFound ? gtk_inscription_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkInscription";
  }

  /** Returns `this`, for use in `with` statements. */
  override Inscription self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.inscription.Inscription]
      Returns: New builder object
  */
  static InscriptionGidBuilder builder() nothrow
  {
    return new InscriptionGidBuilder;
  }

  /**
      Get `attributes` property.
      Returns: A list of style attributes to apply to the text of the inscription.
  */
  @property gid.pango1.attr_list.AttrList attributes() nothrow
  {
    return getAttributes();
  }

  /**
      Set `attributes` property.
      Params:
        propval = A list of style attributes to apply to the text of the inscription.
  */
  @property void attributes(gid.pango1.attr_list.AttrList propval) nothrow
  {
    setAttributes(propval);
  }

  /**
      Set `markup` property.
      Params:
        propval = Utility property that sets both the [gid.gtk4.inscription.Inscription.text] and
          [gid.gtk4.inscription.Inscription.attributes] properties, mainly intended for use in
          GtkBuilder ui files to ease translation support and bindings.
          
          This function uses `func@Pango.parse_markup` to parse the markup into text and
          attributes. The markup must be valid. If you cannot ensure that, consider using
          `func@Pango.parse_markup` and setting the two properties yourself.
  */
  @property void markup(string propval) nothrow
  {
    setMarkup(propval);
  }

  /**
      Get `minChars` property.
      Returns: The number of characters that should fit into the inscription at minimum.
        
        This influences the requested width, not the width actually given to the widget,
        which might turn out to be larger.
        
        Note that this is an approximate character width, so some characters might be
        wider and some might be thinner, so do not expect the number of characters to
        exactly match.
        
        If you set this property to 0, the inscription will not request any width at all
        and its width will be determined entirely by its surroundings.
  */
  @property uint minChars() nothrow
  {
    return getMinChars();
  }

  /**
      Set `minChars` property.
      Params:
        propval = The number of characters that should fit into the inscription at minimum.
          
          This influences the requested width, not the width actually given to the widget,
          which might turn out to be larger.
          
          Note that this is an approximate character width, so some characters might be
          wider and some might be thinner, so do not expect the number of characters to
          exactly match.
          
          If you set this property to 0, the inscription will not request any width at all
          and its width will be determined entirely by its surroundings.
  */
  @property void minChars(uint propval) nothrow
  {
    setMinChars(propval);
  }

  /**
      Get `minLines` property.
      Returns: The number of lines that should fit into the inscription at minimum.
        
        This influences the requested height, not the height actually given to the widget,
        which might turn out to be larger.
        
        Note that this is an approximate line height, so if the text uses things like fancy
        Unicode or attribute that influence the height, the text might not fit.
        
        If you set this property to 0, the inscription will not request any height at all
        and its height will be determined entirely by its surroundings.
  */
  @property uint minLines() nothrow
  {
    return getMinLines();
  }

  /**
      Set `minLines` property.
      Params:
        propval = The number of lines that should fit into the inscription at minimum.
          
          This influences the requested height, not the height actually given to the widget,
          which might turn out to be larger.
          
          Note that this is an approximate line height, so if the text uses things like fancy
          Unicode or attribute that influence the height, the text might not fit.
          
          If you set this property to 0, the inscription will not request any height at all
          and its height will be determined entirely by its surroundings.
  */
  @property void minLines(uint propval) nothrow
  {
    setMinLines(propval);
  }

  /**
      Get `natChars` property.
      Returns: The number of characters that should ideally fit into the inscription.
        
        This influences the requested width, not the width actually given to the widget.
        The widget might turn out larger as well as smaller.
        
        If this property is set to a value smaller than [gid.gtk4.inscription.Inscription.minChars],
        that value will be used. In particular, for the default value of 0, this will always
        be the case.
  */
  @property uint natChars() nothrow
  {
    return getNatChars();
  }

  /**
      Set `natChars` property.
      Params:
        propval = The number of characters that should ideally fit into the inscription.
          
          This influences the requested width, not the width actually given to the widget.
          The widget might turn out larger as well as smaller.
          
          If this property is set to a value smaller than [gid.gtk4.inscription.Inscription.minChars],
          that value will be used. In particular, for the default value of 0, this will always
          be the case.
  */
  @property void natChars(uint propval) nothrow
  {
    setNatChars(propval);
  }

  /**
      Get `natLines` property.
      Returns: The number of lines that should ideally fit into the inscription.
        
        This influences the requested height, not the height actually given to the widget.
        The widget might turn out larger as well as smaller.
        
        If this property is set to a value smaller than [gid.gtk4.inscription.Inscription.minLines],
        that value will be used. In particular, for the default value of 0, this will always
        be the case.
  */
  @property uint natLines() nothrow
  {
    return getNatLines();
  }

  /**
      Set `natLines` property.
      Params:
        propval = The number of lines that should ideally fit into the inscription.
          
          This influences the requested height, not the height actually given to the widget.
          The widget might turn out larger as well as smaller.
          
          If this property is set to a value smaller than [gid.gtk4.inscription.Inscription.minLines],
          that value will be used. In particular, for the default value of 0, this will always
          be the case.
  */
  @property void natLines(uint propval) nothrow
  {
    setNatLines(propval);
  }

  /**
      Get `text` property.
      Returns: The displayed text.
  */
  @property string text() nothrow
  {
    return getText();
  }

  /**
      Set `text` property.
      Params:
        propval = The displayed text.
  */
  @property void text(string propval) nothrow
  {
    setText(propval);
  }

  /**
      Get `textOverflow` property.
      Returns: The overflow method to use for the text.
  */
  @property gid.gtk4.types.InscriptionOverflow textOverflow() nothrow
  {
    return getTextOverflow();
  }

  /**
      Set `textOverflow` property.
      Params:
        propval = The overflow method to use for the text.
  */
  @property void textOverflow(gid.gtk4.types.InscriptionOverflow propval) nothrow
  {
    setTextOverflow(propval);
  }

  /**
      Get `wrapMode` property.
      Returns: Controls how the line wrapping is done.
        
        Note that unlike [gid.gtk4.label.Label], the default here is [gid.pango1.types.WrapMode.WordChar].
  */
  @property gid.pango1.types.WrapMode wrapMode() nothrow
  {
    return getWrapMode();
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Controls how the line wrapping is done.
          
          Note that unlike [gid.gtk4.label.Label], the default here is [gid.pango1.types.WrapMode.WordChar].
  */
  @property void wrapMode(gid.pango1.types.WrapMode propval) nothrow
  {
    setWrapMode(propval);
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment of the text inside the allocated size.
        
        Compare this to [gid.gtk4.widget.Widget.halign], which determines how the
        inscription's size allocation is positioned in the available space.
  */
  @property float xalign() nothrow
  {
    return getXalign();
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the text inside the allocated size.
          
          Compare this to [gid.gtk4.widget.Widget.halign], which determines how the
          inscription's size allocation is positioned in the available space.
  */
  @property void xalign(float propval) nothrow
  {
    setXalign(propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment of the text inside the allocated size.
        
        Compare this to [gid.gtk4.widget.Widget.valign], which determines how the
        inscription's size allocation is positioned in the available space.
  */
  @property float yalign() nothrow
  {
    return getYalign();
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the text inside the allocated size.
          
          Compare this to [gid.gtk4.widget.Widget.valign], which determines how the
          inscription's size allocation is positioned in the available space.
  */
  @property void yalign(float propval) nothrow
  {
    setYalign(propval);
  }

  mixin AccessibleTextT!();

  /**
      Creates a new [gid.gtk4.inscription.Inscription] with the given text.
  
      Params:
        text = The text to display.
      Returns: a new [gid.gtk4.inscription.Inscription]
  */
  this(string text = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_inscription_new(_text);
    this(_cretval, No.Take);
  }

  /**
      Gets the inscription's attribute list.
      Returns: the attribute list
  */
  gid.pango1.attr_list.AttrList getAttributes() nothrow
  {
    PangoAttrList* _cretval;
    _cretval = gtk_inscription_get_attributes(cast(GtkInscription*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the `min-chars` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.minChars] property.
      Returns: the min-chars property
  */
  uint getMinChars() nothrow
  {
    uint _retval;
    _retval = gtk_inscription_get_min_chars(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `min-lines` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.minLines] property.
      Returns: the min-lines property
  */
  uint getMinLines() nothrow
  {
    uint _retval;
    _retval = gtk_inscription_get_min_lines(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `nat-chars` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.natChars] property.
      Returns: the nat-chars property
  */
  uint getNatChars() nothrow
  {
    uint _retval;
    _retval = gtk_inscription_get_nat_chars(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `nat-lines` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.natLines] property.
      Returns: the nat-lines property
  */
  uint getNatLines() nothrow
  {
    uint _retval;
    _retval = gtk_inscription_get_nat_lines(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Gets the text that is displayed.
      Returns: The displayed text
  */
  string getText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_inscription_get_text(cast(GtkInscription*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the inscription's overflow method.
      Returns: the overflow method
  */
  gid.gtk4.types.InscriptionOverflow getTextOverflow() nothrow
  {
    GtkInscriptionOverflow _cretval;
    _cretval = gtk_inscription_get_text_overflow(cast(GtkInscription*)this._cPtr);
    gid.gtk4.types.InscriptionOverflow _retval = cast(gid.gtk4.types.InscriptionOverflow)_cretval;
    return _retval;
  }

  /**
      Returns line wrap mode used by the inscription.
      
      See [gid.gtk4.inscription.Inscription.setWrapMode].
      Returns: the line wrap mode
  */
  gid.pango1.types.WrapMode getWrapMode() nothrow
  {
    PangoWrapMode _cretval;
    _cretval = gtk_inscription_get_wrap_mode(cast(GtkInscription*)this._cPtr);
    gid.pango1.types.WrapMode _retval = cast(gid.pango1.types.WrapMode)_cretval;
    return _retval;
  }

  /**
      Gets the `xalign` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.xalign] property.
      Returns: the xalign property
  */
  float getXalign() nothrow
  {
    float _retval;
    _retval = gtk_inscription_get_xalign(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `yalign` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.yalign] property.
      Returns: the yalign property
  */
  float getYalign() nothrow
  {
    float _retval;
    _retval = gtk_inscription_get_yalign(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Apply attributes to the inscription text.
      
      These attributes will not be evaluated for sizing the inscription.
  
      Params:
        attrs = a [gid.pango1.attr_list.AttrList]
  */
  void setAttributes(gid.pango1.attr_list.AttrList attrs = null) nothrow
  {
    gtk_inscription_set_attributes(cast(GtkInscription*)this._cPtr, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /**
      Utility function to set the text and attributes to be displayed.
      
      See the [gid.gtk4.inscription.Inscription.markup] property.
  
      Params:
        markup = The markup to display
  */
  void setMarkup(string markup = null) nothrow
  {
    const(char)* _markup = markup.toCString!(No.Malloc, Yes.Nullable);
    gtk_inscription_set_markup(cast(GtkInscription*)this._cPtr, _markup);
  }

  /**
      Sets the `min-chars` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.minChars] property.
  
      Params:
        minChars = the minimum number of characters that should fit, approximately
  */
  void setMinChars(uint minChars) nothrow
  {
    gtk_inscription_set_min_chars(cast(GtkInscription*)this._cPtr, minChars);
  }

  /**
      Sets the `min-lines` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.minLines] property.
  
      Params:
        minLines = the minimum number of lines that should fit, approximately
  */
  void setMinLines(uint minLines) nothrow
  {
    gtk_inscription_set_min_lines(cast(GtkInscription*)this._cPtr, minLines);
  }

  /**
      Sets the `nat-chars` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.natChars] property.
  
      Params:
        natChars = the number of characters that should ideally fit, approximately
  */
  void setNatChars(uint natChars) nothrow
  {
    gtk_inscription_set_nat_chars(cast(GtkInscription*)this._cPtr, natChars);
  }

  /**
      Sets the `nat-lines` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.natLines] property.
  
      Params:
        natLines = the number of lines that should ideally fit
  */
  void setNatLines(uint natLines) nothrow
  {
    gtk_inscription_set_nat_lines(cast(GtkInscription*)this._cPtr, natLines);
  }

  /**
      Sets the text to be displayed.
  
      Params:
        text = The text to display
  */
  void setText(string text = null) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    gtk_inscription_set_text(cast(GtkInscription*)this._cPtr, _text);
  }

  /**
      Sets what to do when the text doesn't fit.
  
      Params:
        overflow = the overflow method to use
  */
  void setTextOverflow(gid.gtk4.types.InscriptionOverflow overflow) nothrow
  {
    gtk_inscription_set_text_overflow(cast(GtkInscription*)this._cPtr, overflow);
  }

  /**
      Controls how line wrapping is done.
  
      Params:
        wrapMode = the line wrapping mode
  */
  void setWrapMode(gid.pango1.types.WrapMode wrapMode) nothrow
  {
    gtk_inscription_set_wrap_mode(cast(GtkInscription*)this._cPtr, wrapMode);
  }

  /**
      Sets the `xalign` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.xalign] property.
  
      Params:
        xalign = the new xalign value, between 0 and 1
  */
  void setXalign(float xalign) nothrow
  {
    gtk_inscription_set_xalign(cast(GtkInscription*)this._cPtr, xalign);
  }

  /**
      Sets the `yalign` of the inscription.
      
      See the [gid.gtk4.inscription.Inscription.yalign] property.
  
      Params:
        yalign = the new yalign value, between 0 and 1
  */
  void setYalign(float yalign) nothrow
  {
    gtk_inscription_set_yalign(cast(GtkInscription*)this._cPtr, yalign);
  }
}

/// Fluent builder implementation template for [gid.gtk4.inscription.Inscription]
class InscriptionGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.accessible_text.AccessibleTextGidBuilderImpl!T
{

  mixin AccessibleTextGidBuilderT!();

  /**
      Set `attributes` property.
      Params:
        propval = A list of style attributes to apply to the text of the inscription.
      Returns: Builder instance for fluent chaining
  */
  T attributes(gid.pango1.attr_list.AttrList propval) nothrow
  {
    return setProperty("attributes", propval);
  }

  /**
      Set `markup` property.
      Params:
        propval = Utility property that sets both the [gid.gtk4.inscription.Inscription.text] and
          [gid.gtk4.inscription.Inscription.attributes] properties, mainly intended for use in
          GtkBuilder ui files to ease translation support and bindings.
          
          This function uses `func@Pango.parse_markup` to parse the markup into text and
          attributes. The markup must be valid. If you cannot ensure that, consider using
          `func@Pango.parse_markup` and setting the two properties yourself.
      Returns: Builder instance for fluent chaining
  */
  T markup(string propval) nothrow
  {
    return setProperty("markup", propval);
  }

  /**
      Set `minChars` property.
      Params:
        propval = The number of characters that should fit into the inscription at minimum.
          
          This influences the requested width, not the width actually given to the widget,
          which might turn out to be larger.
          
          Note that this is an approximate character width, so some characters might be
          wider and some might be thinner, so do not expect the number of characters to
          exactly match.
          
          If you set this property to 0, the inscription will not request any width at all
          and its width will be determined entirely by its surroundings.
      Returns: Builder instance for fluent chaining
  */
  T minChars(uint propval) nothrow
  {
    return setProperty("min-chars", propval);
  }

  /**
      Set `minLines` property.
      Params:
        propval = The number of lines that should fit into the inscription at minimum.
          
          This influences the requested height, not the height actually given to the widget,
          which might turn out to be larger.
          
          Note that this is an approximate line height, so if the text uses things like fancy
          Unicode or attribute that influence the height, the text might not fit.
          
          If you set this property to 0, the inscription will not request any height at all
          and its height will be determined entirely by its surroundings.
      Returns: Builder instance for fluent chaining
  */
  T minLines(uint propval) nothrow
  {
    return setProperty("min-lines", propval);
  }

  /**
      Set `natChars` property.
      Params:
        propval = The number of characters that should ideally fit into the inscription.
          
          This influences the requested width, not the width actually given to the widget.
          The widget might turn out larger as well as smaller.
          
          If this property is set to a value smaller than [gid.gtk4.inscription.Inscription.minChars],
          that value will be used. In particular, for the default value of 0, this will always
          be the case.
      Returns: Builder instance for fluent chaining
  */
  T natChars(uint propval) nothrow
  {
    return setProperty("nat-chars", propval);
  }

  /**
      Set `natLines` property.
      Params:
        propval = The number of lines that should ideally fit into the inscription.
          
          This influences the requested height, not the height actually given to the widget.
          The widget might turn out larger as well as smaller.
          
          If this property is set to a value smaller than [gid.gtk4.inscription.Inscription.minLines],
          that value will be used. In particular, for the default value of 0, this will always
          be the case.
      Returns: Builder instance for fluent chaining
  */
  T natLines(uint propval) nothrow
  {
    return setProperty("nat-lines", propval);
  }

  /**
      Set `text` property.
      Params:
        propval = The displayed text.
      Returns: Builder instance for fluent chaining
  */
  T text(string propval) nothrow
  {
    return setProperty("text", propval);
  }

  /**
      Set `textOverflow` property.
      Params:
        propval = The overflow method to use for the text.
      Returns: Builder instance for fluent chaining
  */
  T textOverflow(gid.gtk4.types.InscriptionOverflow propval) nothrow
  {
    return setProperty("text-overflow", propval);
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Controls how the line wrapping is done.
          
          Note that unlike [gid.gtk4.label.Label], the default here is [gid.pango1.types.WrapMode.WordChar].
      Returns: Builder instance for fluent chaining
  */
  T wrapMode(gid.pango1.types.WrapMode propval) nothrow
  {
    return setProperty("wrap-mode", propval);
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the text inside the allocated size.
          
          Compare this to [gid.gtk4.widget.Widget.halign], which determines how the
          inscription's size allocation is positioned in the available space.
      Returns: Builder instance for fluent chaining
  */
  T xalign(float propval) nothrow
  {
    return setProperty("xalign", propval);
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the text inside the allocated size.
          
          Compare this to [gid.gtk4.widget.Widget.valign], which determines how the
          inscription's size allocation is positioned in the available space.
      Returns: Builder instance for fluent chaining
  */
  T yalign(float propval) nothrow
  {
    return setProperty("yalign", propval);
  }
}

/// Fluent builder for [gid.gtk4.inscription.Inscription]
final class InscriptionGidBuilder : InscriptionGidBuilderImpl!InscriptionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Inscription build() nothrow
  {
    return new Inscription(cast(void*)createGObject(Inscription._getGType), Yes.Take);
  }
}
