return {
	"Tastyep/structlog.nvim",
	config = function()
		require("structlog").configure({
			my_logger = {
				pipelines = {
					{
						level = require("structlog").level.INFO,
						processors = {
							require("structlog").processors.StackWriter(
								{ "line", "file" },
								{ max_parents = 0, stack_level = 0 }
							),
							require("structlog").processors.Timestamper("%H:%M:%S"),
						},
						formatter = require("structlog").formatters.FormatColorizer( --
							"%s [%s] %s: %-30s",
							{ "timestamp", "level", "logger_name", "msg" },
							{ level = require("structlog").formatters.FormatColorizer.color_level() }
						),
						sink = require("structlog").sinks.Console(),
					},
					{
						level = require("structlog").level.WARN,
						processors = {},
						formatter = require("structlog").formatters.Format( --
							"%s",
							{ "msg" },
							{ blacklist = { "level", "logger_name" } }
						),
						sink = require("structlog").sinks.NvimNotify(),
					},
					{
						level = require("structlog").level.TRACE,
						processors = {
							require("structlog").processors.StackWriter({ "line", "file" }, { max_parents = 3 }),
							require("structlog").processors.Timestamper("%H:%M:%S"),
						},
						formatter = require("structlog").formatters.Format( --
							"%s [%s] %s: %-30s",
							{ "timestamp", "level", "logger_name", "msg" }
						),
						sink = require("structlog").sinks.File("./test.log"),
					},
				},
			},
		})
	end,
}
