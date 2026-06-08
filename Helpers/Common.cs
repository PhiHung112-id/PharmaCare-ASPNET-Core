using System.Text;
using System.Globalization;
using System.Text.RegularExpressions;

namespace PharmaCare.Helpers
{
    public static class Common
    {
        public static string? RemoveSign4VietnameseString(this string? str)
        {
            if (string.IsNullOrEmpty(str)) return str;

            string normalizedString = str.Normalize(NormalizationForm.FormD);
            StringBuilder stringBuilder = new StringBuilder();

            foreach (char c in normalizedString)
            {
                UnicodeCategory unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
                if (unicodeCategory != UnicodeCategory.NonSpacingMark)
                {
                    stringBuilder.Append(c);
                }
            }

            return stringBuilder.ToString().Normalize(NormalizationForm.FormC)
                .Replace('đ', 'd')
                .Replace('Đ', 'D');
        }

        public static string? ToUrlFormat(this string? str)
        {
            if (string.IsNullOrEmpty(str)) return str;

            // 1. Loại bỏ dấu tiếng Việt và chuyển về chữ thường
            string result = str.RemoveSign4VietnameseString()?.ToLower() ?? "";

            // 2. Thay thế các ký tự không phải chữ cái hoặc số bằng khoảng trắng
            // (Xử lý các dấu câu như !, @, #, $, %, ^, &, *, ...)
            result = Regex.Replace(result, @"[^a-z0-9\s-]", "");

            // 3. Thay thế khoảng trắng (một hoặc nhiều) bằng một dấu gạch ngang
            result = Regex.Replace(result, @"\s+", "-").Trim();

            // 4. Loại bỏ các dấu gạch ngang liên tiếp (nếu có)
            result = Regex.Replace(result, @"-+", "-");

            return result;
        }
    }
}