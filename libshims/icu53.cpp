/*
 * Copyright (C) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "unicode/utext.h"
#include "unicode/ucnv.h"
#include "unicode/utypes.h"

/* u_digit_48(UChar32 ch, int8_t radix) */
U_CAPI int32_t U_EXPORT2
u_digit_48(UChar32 ch, int8_t radix) {
	return u_digit(ch, radix);
}

/* u_digit_53(UChar32 ch, int8_t radix) */
U_CAPI int32_t U_EXPORT2
u_digit_53(UChar32 ch, int8_t radix) {
    return u_digit(ch, radix);
}

/* utext_close_48(UText *ut) */
U_CAPI UText * U_EXPORT2
utext_close_48(UText *ut) {
	return utext_close(ut);
}

/* utext_close_53(UText *ut) */
U_CAPI UText * U_EXPORT2
utext_close_53(UText *ut) {
    return utext_close(ut);
}

/* utext_openUChars_48(UText *ut, const UChar *s, int64_t length, UErrorCode *status) */
U_CAPI UText * U_EXPORT2
utext_openUChars_48(UText *ut, const UChar *s, int64_t length, UErrorCode *status) {
	return utext_openUChars(ut, s, length, status);
}

/* utext_openUChars_53(UText *ut, const UChar *s, int64_t length, UErrorCode *status) */
U_CAPI UText * U_EXPORT2
utext_openUChars_53(UText *ut, const UChar *s, int64_t length, UErrorCode *status) {
    return utext_openUChars(ut, s, length, status);
}

/* u_errorName_48(UErrorCode code) */
U_CAPI const char * U_EXPORT2
u_errorName_48(UErrorCode code) {
	return u_errorName(code);
}

/* u_errorName_53(UErrorCode code) */
U_CAPI const char * U_EXPORT2
u_errorName_53(UErrorCode code) {
    return u_errorName(code);
}

U_STABLE int32_t U_EXPORT2
ucnv_toUChars_58(UConverter *cnv, UChar *dest, int32_t destCapacity, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
	return ucnv_toUChars(cnv, dest, destCapacity, src, srcLength, pErrorCode);
}

U_STABLE void  U_EXPORT2
ucnv_close_58(UConverter * converter){
	return ucnv_close(converter);
}

U_CAPI UConverter* U_EXPORT2
ucnv_open_58(const char *name,
                       UErrorCode * err)
{
	return ucnv_open(name, err);
}
