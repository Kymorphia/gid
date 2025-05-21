/// Module for [CompletionItem] class
module gtksource.completion_item;

import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_proposal;
import gtksource.completion_proposal_mixin;
import gtksource.types;

/** */
class CompletionItem : gobject.object.ObjectWrap, gtksource.completion_proposal.CompletionProposal
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
    return cast(void function())gtk_source_completion_item_get_type != &gidSymbolNotFound ? gtk_source_completion_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionItem self()
  {
    return this;
  }

  /**
      Get `gicon` property.
      Returns: The #GIcon for the icon to be shown for this proposal.
  */
  @property gio.icon.Icon gicon()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.icon.Icon)("gicon");
  }

  /**
      Set `gicon` property.
      Params:
        propval = The #GIcon for the icon to be shown for this proposal.
  */
  @property void gicon(gio.icon.Icon propval)
  {
    return setGicon(propval);
  }

  /**
      Get `icon` property.
      Returns: The #GdkPixbuf for the icon to be shown for this proposal.
  */
  @property gdkpixbuf.pixbuf.Pixbuf icon()
  {
    return gobject.object.ObjectWrap.getProperty!(gdkpixbuf.pixbuf.Pixbuf)("icon");
  }

  /**
      Set `icon` property.
      Params:
        propval = The #GdkPixbuf for the icon to be shown for this proposal.
  */
  @property void icon(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    return setIcon(propval);
  }

  /**
      Get `iconName` property.
      Returns: The icon name for the icon to be shown for this proposal.
  */
  @property string iconName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("icon-name");
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for the icon to be shown for this proposal.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `info` property.
      Returns: Optional extra information to be shown for this proposal.
  */
  @property string info()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("info");
  }

  /**
      Set `info` property.
      Params:
        propval = Optional extra information to be shown for this proposal.
  */
  @property void info(string propval)
  {
    return setInfo(propval);
  }

  /**
      Get `label` property.
      Returns: Label to be shown for this proposal.
  */
  @property string label()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("label");
  }

  /**
      Set `label` property.
      Params:
        propval = Label to be shown for this proposal.
  */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /**
      Get `markup` property.
      Returns: Label with markup to be shown for this proposal.
  */
  @property string markup()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("markup");
  }

  /**
      Set `markup` property.
      Params:
        propval = Label with markup to be shown for this proposal.
  */
  @property void markup(string propval)
  {
    return setMarkup(propval);
  }

  /**
      Get `text` property.
      Returns: Proposal text.
  */
  @property string text()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = Proposal text.
  */
  @property void text(string propval)
  {
    return setText(propval);
  }

  mixin CompletionProposalT!();

  /**
      Creates a new #GtkSourceCompletionItem. The desired properties need to be set
      afterwards.
      Returns: a new #GtkSourceCompletionItem.
  */
  this()
  {
    GtkSourceCompletionItem* _cretval;
    _cretval = gtk_source_completion_item_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void setGicon(gio.icon.Icon gicon = null)
  {
    gtk_source_completion_item_set_gicon(cast(GtkSourceCompletionItem*)this._cPtr, gicon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)gicon)._cPtr(No.Dup) : null);
  }

  /** */
  void setIcon(gdkpixbuf.pixbuf.Pixbuf icon = null)
  {
    gtk_source_completion_item_set_icon(cast(GtkSourceCompletionItem*)this._cPtr, icon ? cast(GdkPixbuf*)icon._cPtr(No.Dup) : null);
  }

  /** */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_completion_item_set_icon_name(cast(GtkSourceCompletionItem*)this._cPtr, _iconName);
  }

  /** */
  void setInfo(string info = null)
  {
    const(char)* _info = info.toCString(No.Alloc);
    gtk_source_completion_item_set_info(cast(GtkSourceCompletionItem*)this._cPtr, _info);
  }

  /** */
  void setLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_source_completion_item_set_label(cast(GtkSourceCompletionItem*)this._cPtr, _label);
  }

  /** */
  void setMarkup(string markup = null)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_source_completion_item_set_markup(cast(GtkSourceCompletionItem*)this._cPtr, _markup);
  }

  /** */
  void setText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_source_completion_item_set_text(cast(GtkSourceCompletionItem*)this._cPtr, _text);
  }
}
