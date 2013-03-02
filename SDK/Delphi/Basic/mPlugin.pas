unit mPlugin;

interface

uses
{$IF CompilerVersion > 22.9}
  Winapi.Windows, Winapi.Messages;
{$ELSE}
  Windows, Messages;
{$IFEND}


const
  MAX_MODE_NAME = 260;
  MAX_THEME_NAME = 32;

  COLOR_GENERAL = 0;
  COLOR_SELECTION = 1;
  COLOR_CURRENT_LINE = 2;
  COLOR_HYPERLINK = 3;
  COLOR_STRING = 4;
  COLOR_COMMENT = 5;
  COLOR_SCRIPT = 6;
  COLOR_BRACKET = 7;
  COLOR_TAG = 8;
  COLOR_KEYWORD_1 = 9;
  COLOR_KEYWORD_2 = 10;
  COLOR_KEYWORD_3 = 11;
  COLOR_KEYWORD_4 = 12;
  COLOR_KEYWORD_5 = 13;
  COLOR_KEYWORD_6 = 14;
  COLOR_KEYWORD_7 = 15;
  COLOR_KEYWORD_8 = 16;
  COLOR_CRLF = 17;
  COLOR_WRAP = 18;
  COLOR_TAB = 19;
  COLOR_EOF = 20;
  COLOR_CARET_LINE = 21;
  COLOR_LINE_NUMBERS = 22;
  COLOR_RULER = 23;
  COLOR_VERTICAL_LINE = 24;
  COLOR_SB_ALPHABETIC = 25;
  COLOR_SB_NUMBER = 26;
  COLOR_SB_SYMBOL = 27;
  COLOR_SB_KATAKANA = 28;
  COLOR_SB_SPACE = 29;
  COLOR_DB_ALPHABET = 30;
  COLOR_DB_NUMBER = 31;
  COLOR_DB_SYMBOL = 32;
  COLOR_DB_HIRAGANA = 33;
  COLOR_DB_KATAKANA = 34;
  COLOR_DB_KANJI = 35;
  COLOR_DB_SPACE = 36;
  COLOR_BOOKMARK = 37;
  COLOR_SEARCH_STRING = 38;
  COLOR_FOREIGN = 39;
  COLOR_OTHER = 40;
  COLOR_CONTROL = 41;
  COLOR_INVALID = 42;

  CUSTOM_BAR_LEFT = 0;
  CUSTOM_BAR_TOP = 1;
  CUSTOM_BAR_RIGHT = 2;
  CUSTOM_BAR_BOTTOM = 3;
  MAX_CUSTOM_BAR = 4;

  EVENT_CREATE = $00000001;
  EVENT_CLOSE = $00000002;
  EVENT_CREATE_FRAME = $00000004;
  EVENT_CLOSE_FRAME = $00000008;
  EVENT_SET_FOCUS = $00000010;
  EVENT_KILL_FOCUS = $00000020;
  EVENT_FILE_OPENED = $00000040;
  EVENT_FILE_SAVED = $00000080;
  EVENT_MODIFIED = $00000100;
  EVENT_CARET_MOVED = $00000200;
  EVENT_SCROLL = $00000400;
  EVENT_SEL_CHANGED = $00000800;
  EVENT_CHANGED = $00001000;
  EVENT_CHAR = $00002000;
  EVENT_MODE_CHANGED = $00004000;
  EVENT_DOC_SEL_CHANGED = $00008000;
  EVENT_DOC_CLOSE = $00010000;
  EVENT_TAB_MOVED = $00020000;
  EVENT_CUSTOM_BAR_CLOSING = $00040000;
  EVENT_CUSTOM_BAR_CLOSED = $00080000;
  EVENT_TOOL_BAR_CLOSED = $00100000;
  EVENT_TOOL_BAR_SHOW = $00200000;
  EVENT_IDLE = $00400000;

  CLOSED_FRAME_WINDOW = 1;
  CLOSED_ANOTHER_CUSTOM_BAR = 2;

  ME_FIRST = WM_USER + $0400;
  ME_NEW = ME_FIRST + 0;
  ME_GET_CMD_ID = ME_FIRST + 1;
  ME_QUERY_STATUS = ME_FIRST + 2;
  ME_GET_SEL_TEXT = ME_FIRST + 3;
  ME_GET_LINES = ME_FIRST + 4;
  ME_GET_LINE = ME_FIRST + 5;
  ME_GET_CARET_POS = ME_FIRST + 6;
  ME_GET_SCROLL_POS = ME_FIRST + 7;
  ME_LINE_FROM_CHAR = ME_FIRST + 8;
  ME_LINE_INDEX = ME_FIRST + 9;
  ME_LOAD_FILE = ME_FIRST + 10;
  ME_LOGICAL_TO_SERIAL = ME_FIRST + 11;
  ME_LOGICAL_TO_VIEW = ME_FIRST + 12;
  ME_SAVE_FILE = ME_FIRST + 13;
  ME_SERIAL_TO_LOGICAL = ME_FIRST + 14;
  ME_SET_CARET_POS = ME_FIRST + 15;
  ME_SET_SCROLL_POS = ME_FIRST + 16;
  ME_VIEW_TO_LOGICAL = ME_FIRST + 17;
  ME_EXEC_COMMAND = ME_FIRST + 18;
  ME_GET_MODIFIED = ME_FIRST + 19;
  ME_SET_MODIFIED = ME_FIRST + 20;
  ME_GET_SEL_START = ME_FIRST + 21;
  ME_GET_SEL_END = ME_FIRST + 22;
  ME_SET_SEL_LENGTH = ME_FIRST + 23;
  ME_GET_MODE = ME_FIRST + 24;
  ME_SET_MODE = ME_FIRST + 25;
  ME_EMPTY_UNDO_BUFFER = ME_FIRST + 26;
  ME_INSERT_STRING = ME_FIRST + 27;
  ME_SET_SEL_VIEW = ME_FIRST + 28;
  ME_FIND = ME_FIRST + 29;
  ME_REPLACE = ME_FIRST + 30;
  ME_SET_STATUS = ME_FIRST + 31;
  ME_CONVERT = ME_FIRST + 32;
  ME_GET_MARGIN = ME_FIRST + 33;
  ME_GET_VERSION = ME_FIRST + 34;
  ME_REDRAW = ME_FIRST + 35;
  ME_GET_SEL_TYPE = ME_FIRST + 36;
  ME_IS_CHAR_HALF_OR_FULL = ME_FIRST + 37;
  ME_INFO = ME_FIRST + 38;
  ME_GET_STATUS = ME_FIRST + 39;
  ME_CUSTOM_BAR_OPEN = ME_FIRST + 40;
  ME_CUSTOM_BAR_CLOSE = ME_FIRST + 41;
  ME_MATCH_REGEX = ME_FIRST + 42;
  ME_FIND_REGEX = ME_FIRST + 43;
  ME_ENUM_MODE = ME_FIRST + 44;
  ME_TOOL_BAR_OPEN = ME_FIRST + 45;
  ME_TOOL_BAR_CLOSE = ME_FIRST + 46;
  ME_TOOL_BAR_SHOW = ME_FIRST + 47;
  ME_LAST = ME_FIRST + 255;

  MI_GET_FILE_NAME = 256;
  MI_GET_APP_VERSION = 257;
  MI_IS_WINDOW_COMBINED = 258;
  MI_WINDOW_COMBINE = 259;
  MI_GET_DOC_COUNT = 260;
  MI_INDEX_TO_DOC = 261;
  MI_DOC_TO_INDEX = 262;
  MI_GET_ACTIVE_INDEX = 263;
  MI_SET_ACTIVE_INDEX = 264;
  MI_GET_ACTIVE_DOC = 265;
  MI_SET_ACTIVE_DOC = 266;
  MI_CLOSE_DOC = 267;
  MI_SAVE_DOC = 268;
  MI_GET_FONT_NAME = 269;
  MI_GET_FONT_CHARSET = 270;
  MI_GET_FONT_SIZE = 271;
  MI_GET_TEXT_COLOR = 272;
  MI_GET_BACK_COLOR = 273;

  POS_VIEW = 0;
  POS_LOGICAL = 1;
  POS_DEV = 2;
  MAX_LINE_COLUMN_MODE = 4;
  SEL_TYPE_NONE = 0;
  SEL_TYPE_CHAR = 1;
  SEL_TYPE_BOX = 2;
  SEL_TYPE_SELECTED = $0020;
  FLAG_MAKE_LOWER = 0;
  FLAG_MAKE_UPPER = 1;
  FLAG_HAN_TO_ZEN = 2;
  FLAG_ZEN_TO_HAN = 3;
  FLAG_CAPITALIZE = 4;
  FLAG_CONVERT_SELECT_ALL = $0100;
  FLAG_FIND_NEXT = $00000001;
  FLAG_REPLACE_ALL = $00000002;
  FLAG_FIND_OPEN_DOC = $00000004;
  FLAG_FIND_MATCH_CASE = $00000008;
  FLAG_FIND_RECURSIVE = $00000010;
  FLAG_FIND_REG_EX = $00000020;
  FLAG_FIND_WHOLE_WORD = $00000040;
  FLAG_FIND_AROUND = $00000080;
  FLAG_REPLACE_SEL_ONLY = $00000100;
  FLAG_FIND_CLOSE = $00000200;
  FLAG_FIND_FILENAMES_ONLY = $00000400;
  FLAG_REPLACE_BACKUP = $00000800;
  FLAG_LOGICAL = 1;

  MP_FIRST = WM_USER + $0500;
  MP_QUERY_PROPERTIES = MP_FIRST + 0;
  MP_SET_PROPERTIES = MP_FIRST + 1;
  MP_GET_NAME = MP_FIRST + 2;
  MP_GET_VERSION = MP_FIRST + 3;
  MP_PRE_TRANSLATE_MSG = MP_FIRST + 4;
  MP_LAST = MP_FIRST + 50;

  MEID_NEW = 4096;
  MEID_NEW_PASTE = 4097;
  MEID_NEW_PASTE_QUOTES = 4098;
  MEID_OPEN = 4099;
  MEID_FIND_IN_FILES = 4100;
  MEID_SAVE_ALL = 4101;
  MEID_SAVE_CLOSE_ALL = 4102;
  MEID_CLOSE_ALL = 4103;
  MEID_CASCADE = 4104;
  MEID_TILE_HORZ = 4105;
  MEID_TILE_VERT = 4106;
  MEID_MINIMIZE_ALL = 4107;
  MEID_CLOSE_TRAY_ICON = 4108;
  MEID_FILE_NEW = 4109;
  MEID_FILE_OPEN = 4110;
  MEID_FILE_CLOSE_OPEN = 4111;
  MEID_FILE_SAVE = 4112;
  MEID_FILE_SAVE_AS = 4113;
  MEID_FILE_SAVE_ALL = 4114;
  MEID_FILE_INSERT = 4115;
  MEID_FILE_RELOAD_AUTO_SELECT = 4116;
  MEID_FILE_RELOAD_UTF16LE = 4117;
  MEID_FILE_RELOAD_UTF16BE = 4118;
  MEID_FILE_RELOAD_UTF8 = 4119;
  MEID_FILE_RELOAD_UTF7 = 4120;
  MEID_FILE_RELOAD_ARABIC = 4121;
  MEID_FILE_RELOAD_BALTIC = 4122;
  MEID_FILE_RELOAD_CENTRAL_EUROPEAN = 4123;
  MEID_FILE_RELOAD_CHINESE_SIMPLIFIED = 4124;
  MEID_FILE_RELOAD_CHINESE_TRADITIONAL = 4125;
  MEID_FILE_RELOAD_CYRILLIC = 4126;
  MEID_FILE_RELOAD_GREEK = 4127;
  MEID_FILE_RELOAD_HEBREW = 4128;
  MEID_FILE_RELOAD_EUC = 4129;
  MEID_FILE_RELOAD_JIS = 4130;
  MEID_FILE_RELOAD_SHIFTJIS = 4131;
  MEID_FILE_RELOAD_KOREAN = 4132;
  MEID_FILE_RELOAD_THAI = 4133;
  MEID_FILE_RELOAD_TURKISH = 4134;
  MEID_FILE_RELOAD_VIETNAMESE = 4135;
  MEID_FILE_RELOAD_WESTERN_EUROPEAN = 4136;
  MEID_FILE_LINE_ENDING_CRLF = 4137;
  MEID_FILE_LINE_ENDING_CR = 4138;
  MEID_FILE_LINE_ENDING_LF = 4139;
  MEID_FILE_PRINT = 4140;
  MEID_FILE_PRINT_PREVIEW = 4141;
  MEID_FILE_SAVE_CLOSE = 4142;
  MEID_FILE_CLOSE = 4143;
  MEID_FILE_SAVE_CLOSE_ALL = 4144;
  MEID_FILE_CLOSE_ALL = 4145;
  MEID_EDIT_UNDO = 4146;
  MEID_EDIT_REDO = 4147;
  MEID_EDIT_CUT = 4148;
  MEID_EDIT_COPY = 4149;
  MEID_EDIT_PASTE = 4150;
  MEID_EDIT_COPY_QUOTES = 4151;
  MEID_EDIT_DELETE = 4152;
  MEID_EDIT_SELECT_ALL = 4153;
  MEID_EDIT_DATE_TIME = 4154;
  MEID_EDIT_GO_TO_LINE = 4155;
  MEID_EDIT_GO_TO_FILE = 4156;
  MEID_EDIT_READ_ONLY = 4157;
  MEID_EDIT_INSERT_NEW_LINES = 4158;
  MEID_EDIT_REMOVE_NEW_LINES = 4159;
  MEID_EDIT_SPLIT_LINES = 4160;
  MEID_EDIT_JOIN_LINES = 4161;
  MEID_EDIT_UPPER_CASE = 4162;
  MEID_EDIT_LOWER_CASE = 4163;
  MEID_EDIT_CAPITALIZE = 4164;
  MEID_EDIT_HALF_WIDTH = 4165;
  MEID_EDIT_FULL_WIDTH = 4166;
  MEID_EDIT_TABIFY = 4167;
  MEID_EDIT_UNTABIFY = 4168;
  MEID_EDIT_INDENT = 4169;
  MEID_EDIT_UNINDENT = 4170;
  MEID_EDIT_RECONVERT = 4171;
  MEID_EDIT_BASE64_DECODE = 4172;
  MEID_EDIT_INSERT = 4173;
  MEID_EDIT_TOGGLE_BOOKMARK = 4174;
  MEID_EDIT_NEXT_BOOKMARK = 4175;
  MEID_EDIT_PREV_BOOKMARK = 4176;
  MEID_EDIT_CLEAR_BOOKMARK = 4177;
  MEID_EDIT_TOGGLE_SPELL = 4178;
  MEID_EDIT_NEXT_SPELL = 4179;
  MEID_EDIT_PREV_SPELL = 4180;
  MEID_SEARCH_FIND = 4181;
  MEID_SEARCH_NEXT = 4182;
  MEID_SEARCH_PREV = 4183;
  MEID_SEARCH_NEXT_WORD = 4184;
  MEID_SEARCH_PREV_WORD = 4185;
  MEID_SEARCH_REPLACE = 4186;
  MEID_SEARCH_ERASE_FIND_HIGHLIGHT = 4187;
  MEID_SEARCH_FIND_IN_FILES = 4188;
  MEID_SEARCH_REPLACE_IN_FILES = 4189;
  MEID_SEARCH_GOOGLE = 4190;
  MEID_SEARCH_WIKIPEDIA = 4191;
  MEID_VIEW_MODE_CUSTOMIZE = 4192;
  MEID_VIEW_INVERT_COLOR = 4193;
  MEID_VIEW_WRAP_NONE = 4194;
  MEID_VIEW_WRAP_BY_CHAR = 4195;
  MEID_VIEW_WRAP_BY_WINDOW = 4196;
  MEID_VIEW_SHOW_LINE_NUMBERS = 4197;
  MEID_VIEW_SHOW_RULER = 4198;
  MEID_VIEW_SHOW_CRLF = 4199;
  MEID_VIEW_SHOW_WRAP = 4200;
  MEID_VIEW_SHOW_EOF = 4201;
  MEID_VIEW_SHOW_TABS = 4202;
  MEID_VIEW_SHOW_SB_SPACES = 4203;
  MEID_VIEW_SHOW_DB_SPACES = 4204;
  MEID_VIEW_CRLF_DIFFERENT = 4205;
  MEID_VIEW_STANDARD_BAR = 4206;
  MEID_VIEW_MACROS_BAR = 4207;
  MEID_VIEW_PLUGINS_BAR = 4208;
  MEID_VIEW_TOOLS_BAR = 4209;
  MEID_VIEW_TOOL_BAR_TITLES = 4210;
  MEID_VIEW_LOCK_TOOL_BARS = 4211;
  MEID_VIEW_TOOL_BAR_CUSTOMIZE = 4212;
  MEID_VIEW_STATUS_BAR = 4213;
  MEID_VIEW_INC_FONT_SIZE = 4214;
  MEID_VIEW_DEC_FONT_SIZE = 4215;
  MEID_VIEW_FONT_CUSTOMIZE = 4216;
  MEID_MACROS_RECORD = 4217;
  MEID_MACROS_RUN = 4218;
  MEID_MACROS_SAVE = 4219;
  MEID_MACROS_EDIT = 4220;
  MEID_MACROS_SELECT = 4221;
  MEID_MACROS_SELECT_THIS = 4222;
  MEID_MACROS_CUSTOMIZE = 4223;
  MEID_TOOLS_OPTIONS = 4224;
  MEID_TOOLS_COMPLETION = 4225;
  MEID_TOOLS_SQL_FORMAT = 4226;
  MEID_TOOLS_XML_FORMAT = 4227;
  MEID_TOOLS_PLUGIN_CUSTOMIZE = 4228;
  MEID_TOOLS_TOOL_CUSTOMIZE = 4229;
  MEID_TOOLS_POPUP_MENU_CUSTOMIZE = 4230;
  MEID_WINDOW_ALWAYS_TOP = 4231;
  MEID_WINDOW_SPLIT = 4232;
  MEID_WINDOW_NEXT_PANE = 4233;
  MEID_WINDOW_PREV_PANE = 4234;
  MEID_WINDOW_ACTIVE_PANE = 4235;
  MEID_WINDOW_COMBINE = 4236;
  MEID_WINDOW_CASCADE = 4237;
  MEID_WINDOW_TILE_HORZ = 4238;
  MEID_WINDOW_TILE_VERT = 4239;
  MEID_WINDOW_MINIMIZE_ALL = 4240;
  MEID_WINDOW_NEXT = 4241;
  MEID_WINDOW_PREV = 4242;
  MEID_HELP_ONLINE = 4243;
  MEID_HELP_KEYBOARD_MAP = 4244;
  MEID_HELP_ABOUT = 4245;

  MEID_MY_DICTS = 4096;
  MEID_MY_MODES = 5120;
  MEID_MY_MACROS = 6144;
  MEID_MY_PLUGINS = 7168;
  MEID_MY_TOOLS = 8192;

type
  TGetLineInfo = record
    cch: NativeUInt;
    flags: NativeUInt;
    yLine: NativeUInt;
  end;

  PGetLineInfo = ^TGetLineInfo;

type
  TMatchRegExInfo = record
    cbSize: NativeUInt;
    nFlags: NativeUInt;
    pszRegEx: PChar;
    pszText: PChar;
    pszReplace: PChar;
    pszResult: PChar;
    cchResult: NativeInt;
  end;

  PMatchRegExInfo = ^TMatchRegExInfo;

type
  TFindRegExInfo = record
    cbSize: NativeUInt;
    nFlags: NativeUInt;
    pszRegEx: PChar;
    pszText: PChar;
    ppszStart: PPChar;
    ppszEnd: PPChar;
    ppszNext: PPChar;
  end;

  PFindRegExInfo = ^TFindRegExInfo;

type
  TCustomBarInfo = record
    cbSize: NativeUInt;
    hwndCustomBar: THandle;
    hwndClient: THandle;
    pszTitle: PChar;
    iPos: NativeInt;
  end;

  PCustomBarInfo = ^TCustomBarInfo;

type
  TCustomBarCloseInfo = record
    nID: NativeUInt;
    iPos: NativeInt;
    dwFlags: DWORD;
  end;

  PCustomBarCloseInfo = ^TCustomBarCloseInfo;

type
  TToolBarInfo = record
    cbSize: NativeUInt;
    hwndToolBar: THandle;
    hwndClient: THandle;
    pszTitle: PChar;
    nID: NativeUInt;
    nFlags: NativeUInt;
    bVisible: Boolean;
  end;

  PToolBarInfo = ^TToolBarInfo;

function Editor_New(hwnd: THandle): NativeUInt;
function Editor_GetCmdID(hwnd: THandle; hInstance: THandle): NativeUInt;
function Editor_QueryStatus(hwnd: THandle; nCmdID: NativeUInt; pbChecked: PBoolean): Boolean;
function Editor_GetSelText(hwnd: THandle; nBufferSize: NativeUInt; szBuffer: PChar): NativeUInt;
function Editor_GetLines(hwnd: THandle; nLogical: NativeInt): NativeUInt;
function Editor_GetLine(hwnd: THandle; PGetLineInfo: PGetLineInfo; szString: PChar): NativeUInt;
procedure Editor_GetCaretPos(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
procedure Editor_GetScrollPos(hwnd: THandle; pptPos: PPoint);
function Editor_LineFromChar(hwnd: THandle; nLogical: NativeInt; nSerialIndex: NativeUInt): NativeUInt;
function Editor_LineIndex(hwnd: THandle; bLogical: Boolean; yLine: NativeUInt): NativeUInt;
function Editor_LoadFile(hwnd: THandle; bAllowNewWindow: Boolean; szFileName: PChar): Boolean;
function Editor_LogicalToSerial(hwnd: THandle; pptLogical: PPoint): NativeUInt;
procedure Editor_LogicalToView(hwnd: THandle; pptLogical, pptView: PPoint);
function Editor_SaveFile(hwnd: THandle; bReplace: Boolean; szFileName: PChar): Boolean;
procedure Editor_SerialToLogical(hwnd: THandle; nSerial: NativeUInt; pptLogical: PPoint);
procedure Editor_SetCaretPos(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
procedure Editor_SetCaretPosEx(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint; bExtend: Boolean);
procedure Editor_SetScrollPos(hwnd: THandle; pptPos: PPoint);
procedure Editor_ViewToLogical(hwnd: THandle; pptView, pptLogical: PPoint);
procedure Editor_ExecCommand(hwnd: THandle; nCmdID: NativeUInt);
function Editor_GetModified(hwnd: THandle): Boolean;
procedure Editor_SetModified(hwnd: THandle; bModified: Boolean);
procedure Editor_GetSelStart(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
procedure Editor_GetSelEnd(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
procedure Editor_SetSelLength(hwnd: THandle; nLen: NativeUInt);
procedure Editor_GetMode(hwnd: THandle; szModeName: PChar);
procedure Editor_SetMode(hwnd: THandle; szModeName: PChar);
procedure Editor_EmptyUndoBuffer(hwnd: THandle);
procedure Editor_InsertString(hwnd: THandle; szString: PChar);
procedure Editor_SetSelView(hwnd: THandle; pptSelStart, pptSelEnd: PPoint);
function Editor_Find(hwnd: THandle; nFlags: NativeUInt; szFind: PChar): Boolean;
function Editor_Replace(hwnd: THandle; nFlags: NativeUInt; szFindReplace: PChar): Boolean;
procedure Editor_SetStatus(hwnd: THandle; szStatus: PChar);
function Editor_Convert(hwnd: THandle; nFlags: NativeUInt): Boolean;
function Editor_GetMargin(hwnd: THandle): NativeUInt;
function Editor_GetVersion(hwnd: THandle): NativeUInt;
function Editor_GetVersionEx(hwnd: THandle; pnProductType: NativeUInt): NativeUInt;
procedure Editor_Redraw(hwnd: THandle; bRedraw: Boolean);
function Editor_GetSelType(hwnd: THandle): NativeInt;
function Editor_IsCharHalfOrFull(hwnd: THandle; ch: Char): NativeInt;
function Editor_Info(hwnd: THandle; nCmd: WPARAM; lParam: LPARAM): NativeInt;
function Editor_GetStatus(hwnd: THandle; szStatus: PChar; nBufferSize: NativeUInt): NativeUInt;
function Editor_CustomBarOpen(hwnd: THandle; PCustomBarInfo: PCustomBarInfo): NativeUInt;
function Editor_CustomBarClose(hwnd: THandle; nCustomBarID: NativeUInt): Boolean;
function Editor_MatchRegEx(hwnd: THandle; PMatchRegExInfo: PMatchRegExInfo): Boolean;
function Editor_FindRegEx(hwnd: THandle; PFindRegExInfo: PFindRegExInfo): Boolean;
function Editor_EnumMode(hwnd: THandle; pBuf: PChar; cchBuf: NativeUInt): NativeUInt;
function Editor_ToolBarOpen(hwnd: THandle; PToolBarInfo: PToolBarInfo): NativeUInt;
function Editor_ToolBarClose(hwnd: THandle; nToolBarID: NativeUInt): Boolean;
function Editor_ToolBarShow(hwnd: THandle; nToolBarID: NativeUInt; bVisible: Boolean): Boolean;

{$R *.RES}

implementation

// -----------------------------------------------------------------------------
// Editor_New
//   �V�K�Ƀt�@�C�����쐬���܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
// �߂�l
//   �E�B���h�E�̃n���h��

function Editor_New(hwnd: THandle): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_NEW, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetCmdID
//   �v���O�C���̃R�}���hID���擾���܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   hInstance: �v���O�C���̃C���X�^���X�̃n���h��
// �߂�l
//   �v���O�C�������s���邽�߂̃R�}���hID

function Editor_GetCmdID(hwnd: THandle; hInstance: THandle): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_CMD_ID, 0, hInstance);
end;

// -----------------------------------------------------------------------------
// Editor_QueryStatus
//   �v���O�C�������s�\���A�܂��̓`�F�b�N���ꂽ��Ԃ��𒲂ׂ܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   nCmdID:    ���s����v���O�C���̃R�}���hID
//   pbChecked: �`�F�b�N�̏��
// �߂�l
//   ���s�\�ł����True��Ԃ��܂�

function Editor_QueryStatus(hwnd: THandle; nCmdID: NativeUInt; pbChecked: PBoolean): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_QUERY_STATUS, WPARAM(nCmdID), LPARAM(pbChecked)));
end;

// -----------------------------------------------------------------------------
// Editor_GetSelText
//   �I������Ă��镶������擾���܂�
// �p�����[�^
//   hwnd:        �E�B���h�E�̃n���h��
//   nBufferSize: �I�[�������܂ރo�b�t�@�̃T�C�Y
//   szBuffer:    ��������擾����o�b�t�@�ւ̃|�C���^
// �߂�l
//   nBufferSize��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

function Editor_GetSelText(hwnd: THandle; nBufferSize: NativeUInt; szBuffer: PChar): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_SEL_TEXT, WPARAM(nBufferSize), LPARAM(szBuffer));
end;

// -----------------------------------------------------------------------------
// Editor_GetLines
//   �����̍s�����擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
// �߂�l
//   �����̍s����Ԃ��܂�

function Editor_GetLines(hwnd: THandle; nLogical: NativeInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_LINES, WPARAM(nLogical), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetLine
//   �w�肵���s�̕�������擾���܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   pGetLineInfo: GET_LINE_INFO�\���̂ւ̃|�C���^
//   szString:     ��������擾����o�b�t�@�ւ̃|�C���^
// �߂�l
//   pGetLineInfo->cch��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

function Editor_GetLine(hwnd: THandle; PGetLineInfo: PGetLineInfo; szString: PChar): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_LINE, WPARAM(PGetLineInfo), LPARAM(szString));
end;

// -----------------------------------------------------------------------------
// Editor_GetCaretPos
//   �J�[�\���ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �J�[�\���̈ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_GetCaretPos(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_CARET_POS, WPARAM(nLogical), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_GetScrollPos
//   �X�N���[���o�[�̈ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   pptPos:   �X�N���[���o�[�̈ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_GetScrollPos(hwnd: THandle; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_SCROLL_POS, 0, LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_LineFromChar
//   �w�肵���V���A���ʒu�̍s�ԍ���Ԃ��܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   nLogical:     POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   nSerialIndex: �V���A���ʒu(-1���w�肵���ꍇ�̓J�[�\���ʒu)
// �߂�l
//   �s�ԍ���Ԃ��܂�

function Editor_LineFromChar(hwnd: THandle; nLogical: NativeInt; nSerialIndex: NativeUInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_LINE_FROM_CHAR, WPARAM(nLogical), LPARAM(nSerialIndex));
end;

// -----------------------------------------------------------------------------
// Editor_LineIndex
//   �w�肵���s�ԍ��̃V���A���ʒu��Ԃ��܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   yLine:    �s�ԍ�(-1���w�肵���ꍇ�̓J�[�\���s)
// �߂�l
//   �V���A���ʒu��Ԃ��܂�

function Editor_LineIndex(hwnd: THandle; bLogical: Boolean; yLine: NativeUInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_LINE_INDEX, WPARAM(bLogical), LPARAM(yLine));
end;

// -----------------------------------------------------------------------------
// Editor_LoadFile
//   �t�@�C�����J���܂�
// �p�����[�^
//   hwnd:            �E�B���h�E�̃n���h��
//   bAllowNewWindow: �V�����E�B���h�E�ŊJ���܂�
//   szFileName:      �ǂݍ��ރt�@�C����
// �߂�l
//   ���������True��Ԃ��܂�

function Editor_LoadFile(hwnd: THandle; bAllowNewWindow: Boolean; szFileName: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_LOAD_FILE, WPARAM(bAllowNewWindow), LPARAM(szFileName)));
end;

// -----------------------------------------------------------------------------
// Editor_LogicalToSerial
//   �_�����W���V���A���ʒu�ɕϊ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   pptLogical: �_�����W���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �V���A���ʒu��Ԃ��܂�

function Editor_LogicalToSerial(hwnd: THandle; pptLogical: PPoint): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_LOGICAL_TO_SERIAL, 0, LPARAM(pptLogical));
end;

// -----------------------------------------------------------------------------
// Editor_LogicalToView
//   �_�����W��\�����W�ɕϊ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   pptLogical: �_�����W���w�肵���\���̂ւ̃|�C���^
//   pptView:    �\�����W���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_LogicalToView(hwnd: THandle; pptLogical, pptView: PPoint);
begin
  SendMessage(hwnd, ME_LOGICAL_TO_VIEW, WPARAM(pptLogical), LPARAM(pptView));
end;

// -----------------------------------------------------------------------------
// Editor_SaveFile
//   �t�@�C���ɕۑ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   bReplace:   �g�p����܂���
//   szFileName: �ۑ�����t�@�C����
// �߂�l
//   ���������True��Ԃ��܂�

function Editor_SaveFile(hwnd: THandle; bReplace: Boolean; szFileName: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_SAVE_FILE, WPARAM(bReplace), LPARAM(szFileName)));
end;

// -----------------------------------------------------------------------------
// Editor_SerialToLogical
//   �V���A���ʒu��_�����W�ɕϊ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   nSerial:    �V���A���ʒu
//   pptLogical: �_�����W���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_SerialToLogical(hwnd: THandle; nSerial: NativeUInt; pptLogical: PPoint);
begin
  SendMessage(hwnd, ME_SERIAL_TO_LOGICAL, WPARAM(nSerial), LPARAM(pptLogical));
end;

// -----------------------------------------------------------------------------
// Editor_SetCaretPos
//   �J�[�\���ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �J�[�\���ʒu���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_SetCaretPos(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_SET_CARET_POS, MakeWParam(nLogical, NativeUInt(False)), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_SetCaretPosEx
//   �J�[�\���ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   nLogical:  POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:    �J�[�\���ʒu���w�肵���\���̂ւ̃|�C���^
//   bExtend:   �I��͈͂�L�k���邩�ǂ���
// �߂�l
//   �g�p����܂���

procedure Editor_SetCaretPosEx(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint; bExtend: Boolean);
begin
  SendMessage(hwnd, ME_SET_CARET_POS, MakeWParam(nLogical, NativeUInt(bExtend)), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_SetScrollPos
//   �X�N���[���o�[�̈ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   pptPos: �X�N���[���o�[�̈ʒu���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_SetScrollPos(hwnd: THandle; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_SET_SCROLL_POS, 0, LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_ViewToLogical
//   �\�����W��_�����W�ɕϊ����܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   pptView:    �\�����W���w�肵���\���̂ւ̃|�C���^
//   pptLogical: �_�����W���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_ViewToLogical(hwnd: THandle; pptView, pptLogical: PPoint);
begin
  SendMessage(hwnd, ME_VIEW_TO_LOGICAL, WPARAM(pptView), LPARAM(pptLogical));
end;

// -----------------------------------------------------------------------------
// Editor_ExecCommand
//   �w�肷��R�}���hID�����s���܂�
// �p�����[�^
//   hwnd:    �E�B���h�E�̃n���h��
//   pptView: ���s����R�}���hID
// �߂�l
//   �g�p����܂���

procedure Editor_ExecCommand(hwnd: THandle; nCmdID: NativeUInt);
begin
  SendMessage(hwnd, ME_EXEC_COMMAND, WPARAM(nCmdID), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetModified
//   �������X�V����Ă��邩�ǂ������擾���܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �X�V����Ă���ꍇ��True��Ԃ��܂�

function Editor_GetModified(hwnd: THandle): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_GET_MODIFIED, 0, 0));
end;

// -----------------------------------------------------------------------------
// Editor_SetModified
//   �������X�V����Ă��邩�ǂ�����ݒ肵�܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   bModified: �X�V�̏��
// �߂�l
//   �g�p����܂���

procedure Editor_SetModified(hwnd: THandle; bModified: Boolean);
begin
  SendMessage(hwnd, ME_SET_MODIFIED, WPARAM(bModified), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetSelStart
//   �I�𕶎���̊J�n�ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �I�𕶎���̊J�n�ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_GetSelStart(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_SEL_START, WPARAM(nLogical), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_GetSelEnd
//   �I�𕶎���̏I���ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �I�𕶎���̏I���ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_GetSelEnd(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_SEL_END, WPARAM(nLogical), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_SetSelLength
//   �I�𕶎���̒�����ݒ肵�܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   nLen: �I�𕶎���̒���
// �߂�l
//   �g�p����܂���

procedure Editor_SetSelLength(hwnd: THandle; nLen: NativeUInt);
begin
  SendMessage(hwnd, ME_SET_SEL_LENGTH, WPARAM(nLen), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetMode
//   �ҏW���[�h�𕶎���Ŏ擾���܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   szModeName: ���̂��擾����o�b�t�@(MAX_MODE_NAME�̕�����)
// �߂�l
//   �g�p����܂���

procedure Editor_GetMode(hwnd: THandle; szModeName: PChar);
begin
  SendMessage(hwnd, ME_GET_MODE, 0, LPARAM(szModeName));
end;

// -----------------------------------------------------------------------------
// Editor_SetMode
//   �ҏW���[�h�𕶎���Őݒ肵�܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   szModeName: �ҏW���[�h�̖���
// �߂�l
//   �g�p����܂���

procedure Editor_SetMode(hwnd: THandle; szModeName: PChar);
begin
  SendMessage(hwnd, ME_SET_MODE, 0, LPARAM(szModeName));
end;

// -----------------------------------------------------------------------------
// Editor_EmptyUndoBuffer
//   ���ɖ߂��A��蒼���̃o�b�t�@����ɂ��܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �g�p����܂���

procedure Editor_EmptyUndoBuffer(hwnd: THandle);
begin
  SendMessage(hwnd, ME_EMPTY_UNDO_BUFFER, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_InsertString
//   �J�[�\���ʒu�ɕ������}���܂��͏㏑�����܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szString: �}�����镶����
// �߂�l
//   �g�p����܂���

procedure Editor_InsertString(hwnd: THandle; szString: PChar);
begin
  SendMessage(hwnd, ME_INSERT_STRING, 0, LPARAM(szString));
end;

// -----------------------------------------------------------------------------
// Editor_SetSelView
//   �I�𕶎���̊J�n�ʒu�ƏI���ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:        �E�B���h�E�̃n���h��
//   pptSelStart: �I�𕶎���̊J�n�ʒu��\���\���̂ւ̃|�C���^
//   pptSelEnd:   �I�𕶎���̏I���ʒu��\���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_SetSelView(hwnd: THandle; pptSelStart, pptSelEnd: PPoint);
begin
  SendMessage(hwnd, ME_SET_SEL_VIEW, WPARAM(pptSelStart), LPARAM(pptSelEnd));
end;

// -----------------------------------------------------------------------------
// Editor_Find
//   ��������������܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   nFlags: �t���O
//   szFind: �������镶����
// �߂�l
//   ���������True��Ԃ��܂�
// ���l
//   FLAG_FIND_NEXT:      �������Ɍ������܂�
//   FLAG_FIND_CASE:      �啶���Ə���������ʂ��܂�
//   FLAG_FIND_ONLY_WORD: �P��̂݌������܂�
//   FLAG_FIND_AROUND:    �����܂Ō��������當���Ɉړ����܂�
//   FLAG_FIND_REG_EXP:   ���K�\�����g�p���܂�

function Editor_Find(hwnd: THandle; nFlags: NativeUInt; szFind: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_FIND, WPARAM(nFlags), LPARAM(szFind)));
end;

// -----------------------------------------------------------------------------
// Editor_Replace
//   �������u�����܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   nFlags: �t���O
//   szFind: �������镶����ƒu�����镶����(��؂�A�I�[��#0���w��)
// �߂�l
//   ���������True��Ԃ��܂�
// ���l
//   FLAG_FIND_CASE:        �啶���Ə���������ʂ��܂�
//   FLAG_FIND_ONLY_WORD:   �P��̂݌������܂�
//   FLAG_FIND_REG_EXP:     ���K�\�����g�p���܂�
//   FLAG_REPLACE_SEL_ONLY: �I�������͈݂͂̂�ΏۂƂ��܂�

function Editor_Replace(hwnd: THandle; nFlags: NativeUInt; szFindReplace: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_REPLACE, WPARAM(nFlags), LPARAM(szFindReplace)));
end;

// -----------------------------------------------------------------------------
// Editor_SetStatus
//   �X�e�[�^�X�o�[�ɕ\�����镶�����ݒ肵�܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szStatus: �X�e�[�^�X�o�[�ɕ\�����镶����
// �߂�l
//   �g�p����܂���

procedure Editor_SetStatus(hwnd: THandle; szStatus: PChar);
begin
  SendMessage(hwnd, ME_SET_STATUS, 0, LPARAM(szStatus));
end;

// -----------------------------------------------------------------------------
// Editor_Convert
//   �������ϊ����܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   nFlags: �t���O
// �߂�l
//   ���������True��Ԃ��܂�
// ���l
//   FLAG_MAKE_LOWER:         �������ɕϊ����܂�
//   FLAG_MAKE_UPPER:         �啶���ɕϊ����܂�
//   FLAG_HAN_TO_ZEN:         �S�p�ɕϊ����܂�
//   FLAG_ZEN_TO_HAN:         ���p�ɕϊ����܂�
//   FLAG_CONVERT_SELECT_ALL: �����S�̂�ΏۂƂ��܂�

function Editor_Convert(hwnd: THandle; nFlags: NativeUInt): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_CONVERT, WPARAM(nFlags), 0));
end;

// -----------------------------------------------------------------------------
// Editor_GetMargin
//   �܂�Ԃ�������Ԃ��܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �܂�Ԃ�������Ԃ��܂�

function Editor_GetMargin(hwnd: THandle): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_MARGIN, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetVersion
//   �o�[�W�����ԍ���Ԃ��܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �o�[�W�����ԍ���Ԃ��܂�

function Editor_GetVersion(hwnd: THandle): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_VERSION, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetVersionEx
//   �������Ă��܂���

function Editor_GetVersionEx(hwnd: THandle; pnProductType: NativeUInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_VERSION, WPARAM(pnProductType), 0);
end;

// -----------------------------------------------------------------------------
// Editor_Redraw
//   �E�B���h�E�̍ĕ`����s�����ǂ������w�肵�܂�
// �p�����[�^
//   hwnd:    �E�B���h�E�̃n���h��
//   bRedraw: False���w�肷��ƁA����True���w�肷��܂ōĕ`����s���܂���
// �߂�l
//   �g�p����܂���

procedure Editor_Redraw(hwnd: THandle; bRedraw: Boolean);
begin
  SendMessage(hwnd, ME_REDRAW, WPARAM(bRedraw), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetSelType
//   �I����Ԃ̎�ނ��擾���܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   SEL_TYPE_NONE: �I������Ă��܂���
//   SEL_TYPE_CHAR: �ʏ�I������Ă��܂�
//   SEL_TYPE_BOX:  ��`�I������Ă��܂�

function Editor_GetSelType(hwnd: THandle): NativeInt;
begin
  Result := SendMessage(hwnd, ME_GET_SEL_TYPE, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_IsCharHalfOrFull
//   �w�肷�镶�������p���S�p���𒲂ׂ܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   ch:   ���ׂ�������
// �߂�l
//   ���p�̏ꍇ��1�A�S�p�̏ꍇ��2��Ԃ��܂�

function Editor_IsCharHalfOrFull(hwnd: THandle; ch: Char): NativeInt;
begin
  Result := SendMessage(hwnd, ME_IS_CHAR_HALF_OR_FULL, WPARAM(ch), 0);
end;

// -----------------------------------------------------------------------------
// Editor_Info
//   �����̏����擾�E�ݒ肵�܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   nCmd: �擾�E�ݒ肷����̎��
// �߂�l
//   nCmd�ɂ��قȂ�܂�
// ���l
//   MI_GET_FILE_NAME:      �J���Ă���t�@�C�������擾���܂�
//   MI_GET_APP_VERSION:    �o�[�W�������擾���܂�
//   MI_IS_WINDOW_COMBINED: �^�u�̗L���E�������擾���܂�
//   MI_WINDOW_COMBINE:     �^�u�̗L���E������ݒ肵�܂�
//   MI_GET_DOC_COUNT:      �J���Ă��镶���̐����擾���܂�
//   MI_INDEX_TO_DOC:       �����̃C���f�b�N�X����n���h���ɕϊ����܂�
//   MI_DOC_TO_INDEX:       �����̃n���h������C���f�b�N�X�ɕϊ����܂�
//   MI_GET_ACTIVE_INDEX:   �A�N�e�B�u�ȕ����̃C���f�b�N�X���擾���܂�
//   MI_SET_ACTIVE_INDEX:   �C���f�b�N�X���w�肵�ĕ������A�N�e�B�u�ɂ��܂�
//   MI_GET_ACTIVE_DOC:     �A�N�e�B�u�ȕ����̃n���h�����擾���܂�
//   MI_SET_ACTIVE_DOC:     �n���h�����w�肵�ĕ������A�N�e�B�u�ɂ��܂�
//   MI_CLOSE_DOC:          ��������܂�
//   MI_SAVE_DOC:           ������ۑ����܂�
//   MI_GET_FONT_NAME:      �t�H���g�����擾���܂�
//   MI_GET_FONT_CHARSET:   �t�H���g�̕����Z�b�g���擾���܂�
//   MI_GET_FONT_SIZE:      �t�H���g�̃T�C�Y���擾���܂�
//   MI_GET_TEXT_COLOR:     �����̐F���擾���܂�
//   MI_GET_BACK_COLOR:     �w�i�̐F���擾���܂�

function Editor_Info(hwnd: THandle; nCmd: WPARAM; lParam: LPARAM): NativeInt;
begin
  Result := SendMessage(hwnd, ME_INFO, nCmd, lParam);
end;

// -----------------------------------------------------------------------------
// Editor_GetStatus
//   �X�e�[�^�X�o�[�ɕ\������Ă��镶������擾���܂�
// �p�����[�^
//   hwnd:        �E�B���h�E�̃n���h��
//   szStatus:    ��������擾����o�b�t�@
//   nBufferSize: ��������擾����o�b�t�@�̃T�C�Y
// �߂�l
//   ��������擾����̂ɕK�v�ȃo�b�t�@�̃T�C�Y

function Editor_GetStatus(hwnd: THandle; szStatus: PChar; nBufferSize: NativeUInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_STATUS, WPARAM(nBufferSize), LPARAM(nBufferSize));
end;

// -----------------------------------------------------------------------------
// Editor_CustomBarOpen
//   �J�X�^���o�[���J���܂�
// �p�����[�^
//   hwnd:           �E�B���h�E�̃n���h��
//   pCustomBarInfo: CUSTOM_BAR_INFO�\���̂ւ̃|�C���^
// �߂�l
//   ��������ƃJ�X�^���o�[��ID��Ԃ��܂�

function Editor_CustomBarOpen(hwnd: THandle; PCustomBarInfo: PCustomBarInfo): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_CUSTOM_BAR_OPEN, 0, LPARAM(PCustomBarInfo));
end;

// -----------------------------------------------------------------------------
// Editor_CustomBarClose
//   �J�X�^���o�[����܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   nCustomBarID: �J�X�^���o�[��ID
// �߂�l
//   �g�p����܂���

function Editor_CustomBarClose(hwnd: THandle; nCustomBarID: NativeUInt): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_CUSTOM_BAR_CLOSE, WPARAM(nCustomBarID), 0));
end;

// -----------------------------------------------------------------------------
// Editor_MatchRegEx
//   ���K�\���Ŏw�肵�������񂪈�v���邩�ǂ����𒲂ׂ܂�
// �p�����[�^
//   hwnd:            �E�B���h�E�̃n���h��
//   pMatchRegExInfo: MATCH_REGEX_INFO�\���̂ւ̃|�C���^
// �߂�l
//   �w�肷�镶���񂪈�v����ꍇ��True��Ԃ��܂�

function Editor_MatchRegEx(hwnd: THandle; PMatchRegExInfo: PMatchRegExInfo): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_MATCH_REGEX, 0, LPARAM(PMatchRegExInfo)));
end;

// -----------------------------------------------------------------------------
// Editor_FindRegEx
//   ���K�\�����w�肵�������񂩂猟�����܂�
// �p�����[�^
//   hwnd:            �E�B���h�E�̃n���h��
//   pMatchRegExInfo: FIND_REGEX_INFO�\���̂ւ̃|�C���^
// �߂�l
//   �w�肷�镶���񂪈�v���镶���񂪌��������ꍇ��True��Ԃ��܂�

function Editor_FindRegEx(hwnd: THandle; PFindRegExInfo: PFindRegExInfo): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_FIND_REGEX, 0, LPARAM(PFindRegExInfo)));
end;

// -----------------------------------------------------------------------------
// Editor_EnumMode
//   �ҏW���[�h�̈ꗗ���擾���܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   pBuf:   ��������擾����o�b�t�@�ւ̃|�C���^
//   cchBuf: �I�[�������܂ރo�b�t�@�̃T�C�Y
// �߂�l
//   cchBuf��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

function Editor_EnumMode(hwnd: THandle; pBuf: PChar; cchBuf: NativeUInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_ENUM_MODE, WPARAM(cchBuf), LPARAM(pBuf));
end;

// -----------------------------------------------------------------------------
// Editor_ToolBarOpen
//   �c�[���o�[���J���܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   pToolBarInfo: TOOL_BAR_INFO�\���̂ւ̃|�C���^
// �߂�l
//   ��������ƃc�[���o�[��ID��Ԃ��܂�

function Editor_ToolBarOpen(hwnd: THandle; PToolBarInfo: PToolBarInfo): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_TOOL_BAR_OPEN, 0, LPARAM(PToolBarInfo));
end;

// -----------------------------------------------------------------------------
// Editor_ToolBarClose
//   �c�[���o�[����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   nToolBarID: �c�[���o�[��ID
// �߂�l
//   �g�p����܂���

function Editor_ToolBarClose(hwnd: THandle; nToolBarID: NativeUInt): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_TOOL_BAR_CLOSE, WPARAM(nToolBarID), 0));
end;

// -----------------------------------------------------------------------------
// Editor_ToolBarShow
//   �c�[���o�[�̕\��/��\����؂�ւ��܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   nToolBarID: �c�[���o�[��ID
//   bVisible:   �\���̏��
// �߂�l
//   �g�p����܂���

function Editor_ToolBarShow(hwnd: THandle; nToolBarID: NativeUInt; bVisible: Boolean): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_TOOL_BAR_SHOW, WPARAM(nToolBarID), LPARAM(bVisible)));
end;

end.