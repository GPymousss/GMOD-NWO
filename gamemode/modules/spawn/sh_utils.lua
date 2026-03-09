local SpawnUtils = {}

function SpawnUtils.Trim(str)
	if type(str) ~= "string" then return "" end
	return str:match("^%s*(.-)%s*$")
end

function SpawnUtils.IsEmpty(str)
	return SpawnUtils.Trim(str) == ""
end

function SpawnUtils.IsValidLength(str, min, max)
	min = min or 3
	max = max or 12
	local len = #SpawnUtils.Trim(str)
	return len >= min and len <= max
end

function SpawnUtils.IsAlpha(str)
	return SpawnUtils.Trim(str):match("^[%a%-]+$") ~= nil
end

function SpawnUtils.Capitalize(str)
	str = SpawnUtils.Trim(str)
	return str:sub(1,1):upper() .. str:sub(2):lower()
end

function SpawnUtils.ValidateName(firstname, lastname)
	local errors = {}

	if SpawnUtils.IsEmpty(firstname) then
		errors.firstname = "empty"
	elseif not SpawnUtils.IsValidLength(firstname) then
		errors.firstname = "length"
	elseif not SpawnUtils.IsAlpha(firstname) then
		errors.firstname = "invalid"
	end

	if SpawnUtils.IsEmpty(lastname) then
		errors.lastname = "empty"
	elseif not SpawnUtils.IsValidLength(lastname) then
		errors.lastname = "length"
	elseif not SpawnUtils.IsAlpha(lastname) then
		errors.lastname = "invalid"
	end

	return next(errors) == nil, errors
end

function SpawnUtils.SanitizeName(firstname, lastname)
	return SpawnUtils.Capitalize(firstname), SpawnUtils.Capitalize(lastname)
end

local ErrorMessages = {
	firstname = {
		empty   = "Le prénom ne peut pas être vide.",
		length  = "Le prénom doit contenir entre 3 et 12 caractères.",
		invalid = "Le prénom ne peut contenir que des lettres.",
	},
	lastname = {
		empty   = "Le nom ne peut pas être vide.",
		length  = "Le nom doit contenir entre 3 et 12 caractères.",
		invalid = "Le nom ne peut contenir que des lettres.",
	},
}

function SpawnUtils.GetErrorMessage(field, code)
	if ErrorMessages[field] and ErrorMessages[field][code] then
		return ErrorMessages[field][code]
	end
	return "Erreur inconnue."
end

function SpawnUtils.IsValidSteamID64(steamid)
	return type(steamid) == "string" and #steamid == 17 and steamid:match("^%d+$") ~= nil
end

return SpawnUtils