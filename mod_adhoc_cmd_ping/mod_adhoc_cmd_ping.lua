-- Copyright (C) 2009 Thilo Cestonaro
-- 
-- This file is MIT/X11 licensed. Please see the
-- COPYING file in the source package for more information.
--

local st = require "util.stanza";

function ping_command_handler (item, origin, stanza)
	local now = os.date("%Y-%m-%dT%X")
	origin.send(st.reply(stanza):tag("command", {xmlns="http://jabber.org/protocol/commands", status="completed", node=item.node, sessionid=now})
		:tag("note", {type="info"}):text(item.name));
	return true;
end

module:add_item ("adhoc", { name="Ping", node="ping", handler=ping_command_handler });
