using System;
using System.Runtime.InteropServices;

namespace cds
{
	[StructLayout(LayoutKind.Explicit)]
	public struct DEVMODE
	{
		[FieldOffset(102)]
		public short dmLogPixels;

		[FieldOffset(104)]
		public int dmBitsPerPel;

		[FieldOffset(108)]
		public int dmPelsWidth;

		[FieldOffset(112)]
		public int dmPelsHeight;

		[FieldOffset(116)]
		public int dmDisplayFlags;

		[FieldOffset(120)]
		public int dmDisplayFrequency;
	}

	public class Helper
	{
		public static DEVMODE GetDisplaySettings()
		{
			var devMode = new DEVMODE();

			var retCode = EnumDisplaySettings(null, -1, ref devMode);
			if (retCode == 0)
			{
				throw new Exception("can't get resolution from win api");
			}

			return devMode;
		}

		public static string ChangeDisplaySettings(int width, int height, Flags flags)
		{
			var devMode = GetDisplaySettings();

			if (devMode.dmPelsHeight == height && devMode.dmPelsWidth == width)
			{
				return "Settings did not change. Current and target resolutions are the same.";
			}

			devMode.dmPelsWidth = width;
			devMode.dmPelsHeight = height;

			var res = ChangeDisplaySettings(ref devMode, (int)flags);
			switch (res)
			{
				case 0:
					return "The settings change was successful.";
				case 1:
					return "The computer must be restarted for the graphics mode to work.";
				case -1:
					return "The display driver failed the specified graphics mode.";
				case -2:
					return "The graphics mode is not supported.";
				case -3:
					return "Unable to write settings to the registry.";
				case -4:
					return "An invalid set of flags was passed in.";
				case -5:
					return "An invalid parameter was passed in. This can include an invalid flag or combination of flags.";
				case -6:
					return "The settings change was unsuccessful because the system is DualView capable.";
				default:
					return "unknow return code: " + res;
			}
		}

		[DllImport("user32.dll")]
		private static extern int EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode);

		[DllImport("user32.dll")]
		private static extern int ChangeDisplaySettings(ref DEVMODE devMode, int flags);

		[Flags]
		public enum Flags : int
		{
			CDS_UPDATEREGISTRY = 0x01,
			CDS_TEST = 0x02,
			CDS_FULLSCREEN = 0x04,
			CDS_GLOBAL = 0x08,
			CDS_SET_PRIMARY = 0x10,
			CDS_RESET = 0x40000000,
			CDS_NORESET = 0x10000000
		}
	}
}