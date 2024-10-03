-- 导入上游 intl.lua 的部分函数
local locale = {}
local cache = {}
function get_languages()
	local languages = {}

	for _, lang in ipairs(comma_split(options.languages)) do
		if (lang == 'slang') then
			local slang = mp.get_property_native('slang')
			if slang then
				itable_append(languages, slang)
			end
		else
			languages[#languages +1] = lang
		end
	end

	return languages
end
---@param path string
function get_locale_from_json(path)
	local expand_path = mp.command_native({'expand-path', path})

	local meta, meta_error = utils.file_info(expand_path)
	if not meta or not meta.is_file then
		return nil
	end

	local json_file = io.open(expand_path, 'r')
	if not json_file then
		return nil
	end

	local json = json_file:read('*all')
	json_file:close()

	local json_table = utils.parse_json(json)
	return json_table
end
---@param text string
function t(text, a)
	if not text then return '' end
	local key = text
	if a then key = key .. '|' .. a end
	if cache[key] then return cache[key] end
	cache[key] = string.format(locale[text] or text, a or '')
	return cache[key]
end


ulang = {

	-- context_menu_default
	_cm_load = '載入',
	_cm_file_browser = '※ 檔案瀏覽器',
	_cm_import_sid = '※ 導入 字幕軌',
	_cm_navigation = '導航',
	_cm_playlist = '※ 播放列表',
	_cm_edition_list = '※ 版本列表',
	_cm_chapter_list = '※ 章節列表',
	_cm_vid_list = '※ 影片軌列表',
	_cm_aid_list = '※ 音訊軌列表',
	_cm_sid_list = '※ 字幕軌列表',
	_cm_playlist_shuffle = '播放列表亂序重排',
	_cm_ushot = '※ 截圖',
	_cm_video = '視訊',
	_cm_decoding_api = '切換 解碼模式',
	_cm_deband_toggle = '切換 去色帶狀態',
	_cm_deint_toggle = '切換 去隔行狀態',
	_cm_icc_toggle = '切換 自動校色',
	_cm_corpts_toggle = '切換 時間碼解析模式',
	_cm_tools = '工具',
	_cm_keybinding = '※ 按鍵綁定列表',
	_cm_stats_toggle = '開關 常駐統計資訊',
	_cm_console_on = '顯示控制台',
	_cm_border_toggle = '切換 窗口邊框',
	_cm_ontop_toggle = '切換 窗口置頂',
	_cm_audio_device = '※ 音訊輸出設備列表',
	_cm_stream_quality = '※ 串流傳輸品質',
	_cm_show_file_dir = '※ 打開 當前檔案所在路徑',
	_cm_show_config_dir = '※ 打開 設置目錄',
	_cm_stop = '停止',
	_cm_quit = '退出mpv',

	-- no-border-title
	_border_title= '未載入檔案',

	-- track_loaders sub_menu menu_data
	_sid_menu = '字幕軌',
	_aid_menu = '音訊軌',
	_vid_menu = '視訊軌',
	_import_id_menu = '導入 ',

	-- _menu_item_empty_title = '空',
	_menu_search = '輸入並按 Ctrl+ENTER 進行搜索',
	_menu_search2 = '輸入以搜尋',

	_input_empty = 'input-bindings 為空',

	_sid_submenu_title = '字幕軌列表',
	_sid_sec_submenu_title = '次字幕軌列表',
	_aid_submenu_title = '音訊軌列表',
	_vid_submenu_title = '視訊軌列表',
	_playlist_submenu_title = '播放列表',
	_chapter_list_submenu_title = '章節列表',
	_chapter_list_submenu_item_title = '未命名章節 ',
	_edition_list_submenu_title = '版本列表',
	_edition_list_submenu_item_title = '版本',
	_stream_quality_submenu_title = '串流傳輸品質',
	_audio_device_submenu_title = '音訊輸出設備列表',
	_audio_device_submenu_item_title = '自動',

	_dlsub_download = '下載',
	_dlsub_searchol = '線上搜尋',
	_dlsub_invalid_response = '無效的JSON回應',
	_dlsub_process_exit = '進程退出代碼',
	_dlsub_unknown_err = '未知錯誤',
	_dlsub_err = '錯誤',
	_dlsub_fin = '下載完成且已載入',
	_dlsub_remain = '今日剩餘下載量',
	_dlsub_reset = '重設',
	_dlsub_foreign = '僅外語部分',
	_dlsub_hearing = '聽力障礙',
	_dlsub_result0 = '無結果',
	_dlsub_page_prev = '上一頁',
	_dlsub_page_next = '下一頁',
	_dlsub_2search = 'Ctrl+ENTER 搜索',
	_dlsub_enter_query = '輸入查詢',

	_submenu_import = '導入',
	_submenu_load_file = '開啟檔案',
	_submenu_id_disabled = '禁用',
	_submenu_id_hint = '聲道',
	_submenu_id_forced = '強制',
	_submenu_id_default = '預設',
	_submenu_id_external = '外掛',
	_submenu_id_title = '軌道 ',
	_submenu_file_browser_item_hint = '磁碟機列表',
	_submenu_file_browser_item_hint2 = '上層目錄',
	_submenu_file_browser_item2_hint = '磁碟機代號',
	_submenu_file_browser_title = '磁碟機列表',

	-- built-in_shortcut
	_button01 = '菜單',
	_button02 = '字幕軌',
	_button03 = '音訊軌',
	_button04 = '音訊設備',
	_button05 = '視訊軌',
	_button06 = '播放列表',
	_button07 = '章節',
	_button08 = '版本',
	_button09 = '串流品質',
	_button10 = '開啟檔案',
	_button11 = '播放列表/檔案瀏覽器',
	_button12 = '上一個',
	_button13 = '下一個',
	_button14 = '首位',
	_button15 = '末位',
	_button16 = '列表循環',
	_button17 = '單曲循環',
	_button18 = '亂序播放',
	_button19 = '切換全螢幕',

	_button_ext01 = '播放/暫停',
	_button_ext02 = '播放/暫停',
	_button_ext03 = '上一個',
	_button_ext04 = '下一個',
	_button_ext05 = '窗口邊框',
	_button_ext06 = '置頂',
	_button_ext07 = '硬解',
	_button_ext08 = '原始尺寸',
	_button_ext09 = '去色帶',
	_button_ext10 = '反交錯',
	_button_ext11 = '截圖',
	_button_ext12 = '統計數據',
	_button_ext13 = '時間軸預覽',

}

opt.read_options(ulang, "uosc_lang")
