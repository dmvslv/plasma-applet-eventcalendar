import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore

import ".."
import "../lib"

ConfigPage {
	id: page

	property int indentWidth: 24 * units.devicePixelRatio

	ConfigCheckBox {
		configKey: 'widget_show_agenda'
		text: i18n("Show agenda")
	}

	ConfigSection {
		ConfigSpinBox {
			configKey: 'agenda_fontSize'
			before: i18n("Font Size:")
			suffix: i18n("px")
			after: i18n(" (0px = <b>System Settings > Fonts > General</b>)")
		}
	}

	ConfigSection {
		RowLayout {
			ConfigCheckBox {
				configKey: 'agenda_weather_show_icon'
				checked: true
				text: i18n("Weather Icon")
			}
			ConfigSlider {
				configKey: 'agenda_weather_icon_height'
				minimumValue: 12
				maximumValue: 48
				stepSize: 1
				after: '' + value + i18n("px")
				Layout.fillWidth: false
			}
		}

		RowLayout {
			Text { width: indentWidth } // Indent
			ConfigCheckBox {
				configKey: 'show_outlines'
				text: i18n("Icon Outline")
			}
		}

		ConfigCheckBox {
			configKey: 'agenda_weather_show_text'
			text: i18n("Weather Text")
		}

		ConfigRadioButtonGroup {
			configKey: 'agendaWeatherOnRight'
			label: i18n("Position:")
			model: [
				{ value: false, text: i18n("Left") },
				{ value: true, text: i18n("Right") },
			]
		}

		ConfigRadioButtonGroup {
			id: clickWeatherGroup
			label: i18n("Click Weather:")
			RadioButton {
				text: i18n("Open City Forecast In Browser")
				exclusiveGroup: clickWeatherGroup.exclusiveGroup
				checked: true
			}
		}
	}

	ConfigSection {
		ConfigRadioButtonGroup {
			id: clickDateGroup
			label: i18n("Click Date:")
			RadioButton {
				text: i18n("Open New Event In Browser")
				exclusiveGroup: clickDateGroup.exclusiveGroup
				enabled: false
			}
			RadioButton {
				text: i18n("Open New Event Form")
				exclusiveGroup: clickDateGroup.exclusiveGroup
				checked: true
			}
		}
	}

	ConfigSection {
		ConfigCheckBox {
			configKey: 'agendaShowEventDescription'
			text: i18n("Event description")
		}
		ConfigCheckBox {
			configKey: 'agendaCondensedAllDayEvent'
			text: i18n("Hide 'All Day' text")
		}
		ConfigCheckBox {
			configKey: 'agendaShowEventHangoutLink'
			text: i18n("Google Hangouts link")
		}
		ConfigRadioButtonGroup {
			id: clickEventGroup
			label: i18n("Click Event:")
			RadioButton {
				text: i18n("Open Event In Browser")
				exclusiveGroup: clickEventGroup.exclusiveGroup
				checked: true
			}
		}
	}


	ConfigSection {
		ConfigRadioButtonGroup {
			configKey: 'agenda_breakup_multiday_events'
			label: i18n("Show multi-day events:")
			model: [
				{ value: true, text: i18n("On all days") },
				{ value: false, text: i18n("Only on the first and current day") },
			]
		}
	}

	ConfigSection {
		ConfigCheckBox {
			configKey: 'agenda_newevent_remember_calendar'
			text: i18n("Remember selected calendar in New Event Form")
		}
	}

	ConfigSection {
		title: i18n("Current Month")

		CheckBox {
			enabled: false
			checked: true
			text: i18n("Always show next 14 days")
		}
		CheckBox {
			enabled: false
			checked: false
			text: i18n("Hide completed events")
		}
		CheckBox {
			enabled: false
			checked: true
			text: i18n("Show all events of the current day (including completed events)")
		}
	}

	AppletConfig { id: config }
	ColorGrid {
		title: i18n("Colors")

		ConfigColor {
			configKey: 'agenda_inProgressColor'
			label: i18n("In Progress")
			defaultColor: config.agendaInProgressColorDefault
		}
	}

	ConfigSection {
		ConfigSpinBox {
			configKey: 'agendaDaySpacing'
			before: i18n("Day Spacing:")
			suffix: i18n("px")
		}
		ConfigSpinBox {
			configKey: 'agendaEventSpacing'
			before: i18n("Event Spacing:")
			suffix: i18n("px")
		}
	}

}
