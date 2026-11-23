/// Module for [CompletionItem] class
module gid.gtksource4.completion_item;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.completion_proposal;
import gid.gtksource4.completion_proposal_mixin;
import gid.gtksource4.types;

/** */
class CompletionItem : gid.gobject2.object.ObjectWrap, gid.gtksource4.completion_proposal.CompletionProposal
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
    return cast(void function())gtk_source_completion_item_get_type != &gidSymbolNotFound ? gtk_source_completion_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceCompletionItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.completion_item.CompletionItem]
      Returns: New builder object
  */
  static CompletionItemGidBuilder builder() nothrow
  {
    return new CompletionItemGidBuilder;
  }

  /**
      Get `gicon` property.
      Returns: The #GIcon for the icon to be shown for this proposal.
  */
  @property gid.gio2.icon.Icon gicon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.icon.Icon)("gicon");
  }

  /**
      Set `gicon` property.
      Params:
        propval = The #GIcon for the icon to be shown for this proposal.
  */
  @property void gicon(gid.gio2.icon.Icon propval) nothrow
  {
    setGicon(propval);
  }

  /**
      Get `icon` property.
      Returns: The #GdkPixbuf for the icon to be shown for this proposal.
  */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf icon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("icon");
  }

  /**
      Set `icon` property.
      Params:
        propval = The #GdkPixbuf for the icon to be shown for this proposal.
  */
  @property void icon(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    setIcon(propval);
  }

  /**
      Get `iconName` property.
      Returns: The icon name for the icon to be shown for this proposal.
  */
  @property string iconName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("icon-name");
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for the icon to be shown for this proposal.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `info` property.
      Returns: Optional extra information to be shown for this proposal.
  */
  @property string info() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("info");
  }

  /**
      Set `info` property.
      Params:
        propval = Optional extra information to be shown for this proposal.
  */
  @property void info(string propval) nothrow
  {
    setInfo(propval);
  }

  /**
      Get `label` property.
      Returns: Label to be shown for this proposal.
  */
  @property string label() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("label");
  }

  /**
      Set `label` property.
      Params:
        propval = Label to be shown for this proposal.
  */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /**
      Get `markup` property.
      Returns: Label with markup to be shown for this proposal.
  */
  @property string markup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("markup");
  }

  /**
      Set `markup` property.
      Params:
        propval = Label with markup to be shown for this proposal.
  */
  @property void markup(string propval) nothrow
  {
    setMarkup(propval);
  }

  /**
      Get `text` property.
      Returns: Proposal text.
  */
  @property string text() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = Proposal text.
  */
  @property void text(string propval) nothrow
  {
    setText(propval);
  }

  mixin CompletionProposalT!();

  /**
      Creates a new #GtkSourceCompletionItem. The desired properties need to be set
      afterwards.
      Returns: a new #GtkSourceCompletionItem.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkSourceCompletionItem* _cretval;
      _cretval = gtk_source_completion_item_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  void setGicon(gid.gio2.icon.Icon gicon = null) nothrow
  {
    gtk_source_completion_item_set_gicon(cast(GtkSourceCompletionItem*)this._cPtr, gicon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)gicon)._cPtr(No.Dup) : null);
  }

  /** */
  void setIcon(gid.gdkpixbuf2.pixbuf.Pixbuf icon = null) nothrow
  {
    gtk_source_completion_item_set_icon(cast(GtkSourceCompletionItem*)this._cPtr, icon ? cast(GdkPixbuf*)icon._cPtr(No.Dup) : null);
  }

  /** */
  void setIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    gtk_source_completion_item_set_icon_name(cast(GtkSourceCompletionItem*)this._cPtr, _iconName);
  }

  /** */
  void setInfo(string info = null) nothrow
  {
    const(char)* _info = info.toCString!(No.Malloc, Yes.Nullable);
    gtk_source_completion_item_set_info(cast(GtkSourceCompletionItem*)this._cPtr, _info);
  }

  /** */
  void setLabel(string label = null) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    gtk_source_completion_item_set_label(cast(GtkSourceCompletionItem*)this._cPtr, _label);
  }

  /** */
  void setMarkup(string markup = null) nothrow
  {
    const(char)* _markup = markup.toCString!(No.Malloc, Yes.Nullable);
    gtk_source_completion_item_set_markup(cast(GtkSourceCompletionItem*)this._cPtr, _markup);
  }

  /** */
  void setText(string text = null) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    gtk_source_completion_item_set_text(cast(GtkSourceCompletionItem*)this._cPtr, _text);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.completion_item.CompletionItem]
class CompletionItemGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtksource4.completion_proposal.CompletionProposalGidBuilderImpl!T
{

  mixin CompletionProposalGidBuilderT!();

  /**
      Set `gicon` property.
      Params:
        propval = The #GIcon for the icon to be shown for this proposal.
      Returns: Builder instance for fluent chaining
  */
  T gicon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("gicon", propval);
  }

  /**
      Set `icon` property.
      Params:
        propval = The #GdkPixbuf for the icon to be shown for this proposal.
      Returns: Builder instance for fluent chaining
  */
  T icon(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("icon", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for the icon to be shown for this proposal.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `info` property.
      Params:
        propval = Optional extra information to be shown for this proposal.
      Returns: Builder instance for fluent chaining
  */
  T info(string propval) nothrow
  {
    return setProperty("info", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = Label to be shown for this proposal.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /**
      Set `markup` property.
      Params:
        propval = Label with markup to be shown for this proposal.
      Returns: Builder instance for fluent chaining
  */
  T markup(string propval) nothrow
  {
    return setProperty("markup", propval);
  }

  /**
      Set `text` property.
      Params:
        propval = Proposal text.
      Returns: Builder instance for fluent chaining
  */
  T text(string propval) nothrow
  {
    return setProperty("text", propval);
  }
}

/// Fluent builder for [gid.gtksource4.completion_item.CompletionItem]
final class CompletionItemGidBuilder : CompletionItemGidBuilderImpl!CompletionItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CompletionItem build() nothrow
  {
    return new CompletionItem(cast(void*)createGObject(CompletionItem._getGType), Yes.Take);
  }
}
