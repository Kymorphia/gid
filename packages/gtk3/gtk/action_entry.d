/// Module for [ActionEntry] class
module gtk.action_entry;

public import gid.basictypes;
import gid.gid;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    #GtkActionEntry structs are used with [gtk.action_group.ActionGroup.addActions] to
    construct actions.
*/
class ActionEntry : StructWrap!(GtkActionEntry)
{
  /**
      Create a `action_entry.ActionEntry` wrap type.
      Params:
        name = The name of the action.
        stockId = The stock id for the action, or the name of an icon from the
           icon theme.
        label = The label for the action. This field should typically be marked
           for translation, see [gtk.action_group.ActionGroup.setTranslationDomain]. If
           @label is null, the label of the stock item with id @stock_id is used.
        accelerator = The accelerator for the action, in the format understood by
           [gtk.global.acceleratorParse].
        tooltip = The tooltip for the action. This field should typically be
           marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
        callback = The function to call when the action is activated.
  */
  this(string name = string.init, string stockId = string.init, string label = string.init, string accelerator = string.init, string tooltip = string.init, GCallback callback = GCallback.init) nothrow
  {
    this.name = name;
    this.stockId = stockId;
    this.label = label;
    this.accelerator = accelerator;
    this.tooltip = tooltip;
    this.callback = callback;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private const(char)* _nameRef; // Keeps borrowed GC string alive

  /**
      Get `name` field.
      Returns: The name of the action.
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkActionEntry*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = The name of the action.
  */
  @property void name(string propval) nothrow
  {
    if (_refuseBorrowedStore("name"))
      return;

    _nameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkActionEntry*)this._cPtr).name = cast(const(char)*)_nameRef;
  }

  private const(char)* _stockIdRef; // Keeps borrowed GC string alive

  /**
      Get `stockId` field.
      Returns: The stock id for the action, or the name of an icon from the
         icon theme.
  */
  @property string stockId() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkActionEntry*)this._cPtr).stockId);
  }

  /**
      Set `stockId` field.
      Params:
        propval = The stock id for the action, or the name of an icon from the
           icon theme.
  */
  @property void stockId(string propval) nothrow
  {
    if (_refuseBorrowedStore("stockId"))
      return;

    _stockIdRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkActionEntry*)this._cPtr).stockId = cast(const(char)*)_stockIdRef;
  }

  private const(char)* _labelRef; // Keeps borrowed GC string alive

  /**
      Get `label` field.
      Returns: The label for the action. This field should typically be marked
         for translation, see [gtk.action_group.ActionGroup.setTranslationDomain]. If
         @label is null, the label of the stock item with id @stock_id is used.
  */
  @property string label() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkActionEntry*)this._cPtr).label);
  }

  /**
      Set `label` field.
      Params:
        propval = The label for the action. This field should typically be marked
           for translation, see [gtk.action_group.ActionGroup.setTranslationDomain]. If
           @label is null, the label of the stock item with id @stock_id is used.
  */
  @property void label(string propval) nothrow
  {
    if (_refuseBorrowedStore("label"))
      return;

    _labelRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkActionEntry*)this._cPtr).label = cast(const(char)*)_labelRef;
  }

  private const(char)* _acceleratorRef; // Keeps borrowed GC string alive

  /**
      Get `accelerator` field.
      Returns: The accelerator for the action, in the format understood by
         [gtk.global.acceleratorParse].
  */
  @property string accelerator() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkActionEntry*)this._cPtr).accelerator);
  }

  /**
      Set `accelerator` field.
      Params:
        propval = The accelerator for the action, in the format understood by
           [gtk.global.acceleratorParse].
  */
  @property void accelerator(string propval) nothrow
  {
    if (_refuseBorrowedStore("accelerator"))
      return;

    _acceleratorRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkActionEntry*)this._cPtr).accelerator = cast(const(char)*)_acceleratorRef;
  }

  private const(char)* _tooltipRef; // Keeps borrowed GC string alive

  /**
      Get `tooltip` field.
      Returns: The tooltip for the action. This field should typically be
         marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property string tooltip() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkActionEntry*)this._cPtr).tooltip);
  }

  /**
      Set `tooltip` field.
      Params:
        propval = The tooltip for the action. This field should typically be
           marked for translation, see [gtk.action_group.ActionGroup.setTranslationDomain].
  */
  @property void tooltip(string propval) nothrow
  {
    if (_refuseBorrowedStore("tooltip"))
      return;

    _tooltipRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GtkActionEntry*)this._cPtr).tooltip = cast(const(char)*)_tooltipRef;
  }

  /**
      Get `callback` field.
      Returns: The function to call when the action is activated.
  */
  @property GCallback callback() nothrow
  {
    return (cast(GtkActionEntry*)this._cPtr).callback;
  }

  /**
      Set `callback` field.
      Params:
        propval = The function to call when the action is activated.
  */

  @property void callback(GCallback propval) nothrow
  {
    (cast(GtkActionEntry*)this._cPtr).callback = propval;
  }
}
