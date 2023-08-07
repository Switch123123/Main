--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.14) ~  Much Love, Ferib 

]]--

bit32 = {};
local v0 = 32;
local v1 = 2 ^ v0;
bit32.bnot = function(v26)
	v26 = v26 % v1;
	return (v1 - 1) - v26;
end;
bit32.band = function(v27, v28)
	if (v28 == 255) then
		return v27 % 256;
	end
	if (v28 == 65535) then
		return v27 % 65536;
	end
	if (v28 == 4294967295) then
		return v27 % 4294967296;
	end
	v27, v28 = v27 % v1, v28 % v1;
	local v29 = 0;
	local v30 = 1;
	for v48 = 1, v0 do
		local v49, v50 = v27 % 2, v28 % 2;
		v27, v28 = math.floor(v27 / 2), math.floor(v28 / 2);
		if ((v49 + v50) == 2) then
			v29 = v29 + v30;
		end
		v30 = 2 * v30;
	end
	return v29;
end;
bit32.bor = function(v31, v32)
	if (v32 == 255) then
		return (v31 - (v31 % 256)) + 255;
	end
	if (v32 == 65535) then
		return (v31 - (v31 % 65536)) + 65535;
	end
	if (v32 == 4294967295) then
		return 4294967295;
	end
	v31, v32 = v31 % v1, v32 % v1;
	local v33 = 0;
	local v34 = 1;
	for v51 = 1, v0 do
		local v52, v53 = v31 % 2, v32 % 2;
		v31, v32 = math.floor(v31 / 2), math.floor(v32 / 2);
		if ((v52 + v53) >= 1) then
			v33 = v33 + v34;
		end
		v34 = 2 * v34;
	end
	return v33;
end;
bit32.bxor = function(v35, v36)
	v35, v36 = v35 % v1, v36 % v1;
	local v37 = 0;
	local v38 = 1;
	for v54 = 1, v0 do
		local v55, v56 = v35 % 2, v36 % 2;
		v35, v36 = math.floor(v35 / 2), math.floor(v36 / 2);
		if ((v55 + v56) == 1) then
			v37 = v37 + v38;
		end
		v38 = 2 * v38;
	end
	return v37;
end;
bit32.lshift = function(v39, v40)
	if (math.abs(v40) >= v0) then
		return 0;
	end
	v39 = v39 % v1;
	if (v40 < 0) then
		return math.floor(v39 * (2 ^ v40));
	else
		return (v39 * (2 ^ v40)) % v1;
	end
end;
bit32.rshift = function(v41, v42)
	if (math.abs(v42) >= v0) then
		return 0;
	end
	v41 = v41 % v1;
	if (v42 > 0) then
		return math.floor(v41 * (2 ^ -v42));
	else
		return (v41 * (2 ^ -v42)) % v1;
	end
end;
bit32.arshift = function(v43, v44)
	if (math.abs(v44) >= v0) then
		return 0;
	end
	v43 = v43 % v1;
	if (v44 > 0) then
		local v58 = 0;
		if (v43 >= (v1 / 2)) then
			v58 = v1 - (2 ^ (v0 - v44));
		end
		return math.floor(v43 * (2 ^ -v44)) + v58;
	else
		return (v43 * (2 ^ -v44)) % v1;
	end
end;
local v9 = {};
v9["obf_stringchar%0"] = string.char;
v9["obf_stringbyte%0"] = string.byte;
v9["obf_stringsub%0"] = string.sub;
v9["obf_bitlib%0"] = bit32 or bit;
v9["obf_XOR%0"] = v9["obf_bitlib%0"].bxor;
v9["obf_tableconcat%0"] = table.concat;
v9["obf_tableinsert%0"] = table.insert;
local function v22(v45, v46)
	v9["result%0"] = {};
	for v57 = 1, #v45 do
		v9["obf_tableinsert%0"](v9["result%0"], v9["obf_stringchar%0"](v9["obf_XOR%0"](v9["obf_stringbyte%0"](v9["obf_stringsub%0"](v45, v57, v57 + 1)), v9["obf_stringbyte%0"](v9["obf_stringsub%0"](v46, 1 + (v57 % #v46), 1 + (v57 % #v46) + 1))) % 256));
	end
	return v9["obf_tableconcat%0"](v9["result%0"]);
end
v9["obf_bitlib%1"] = bit32 or bit;
v9["obf_XOR%1"] = v9["obf_bitlib%1"].bxor;
v9["obf_OR%0"] = v9["obf_bitlib%1"].bor;
v9["obf_AND%0"] = v9["obf_bitlib%1"].band;
v9["args%0"] = {[2 - 1]=("\0" .. string.rep("B", 12019684 - 7819684))};
game:GetService(v22("\227\198\203\41\239\184\198\10\212\199\232\49\233\169\198\25\212", "\126\177\163\187\69\134\219\167")):WaitForChild(v22("\17\200\39\202\232\38", "\156\67\173\74\165")):WaitForChild(v22("\7\178\93\34\169\50\73\38\190\72\26\152\41\72\49", "\38\84\215\41\118\220\70")):FireServer(unpack(v9["args%0"]));
v9["args%1"] = {[1 - 0]=("\0" .. string.rep("B", 10818768 - 6618768))};
game:GetService(v22("\98\19\50\30\247\83\23\54\23\250\99\2\45\0\255\87\19", "\158\48\118\66\114")):WaitForChild(v22("\153\33\29\57\103\160", "\155\203\68\112\86\19\197")):WaitForChild(v22("\117\216\34\200\85\108\234\234\79\220\58\216\79\118\224", "\152\38\189\86\156\32\24\133")):FireServer(unpack(v9["args%1"]));
game[v22("\207\67\166\84\232\82\181\97\233\94", "\38\156\55\199")]:SetCore(v22("\155\120\114\44\61\123\238\74\174\116\127\41\7\125\245\77", "\35\200\29\28\72\115\20\154"), {[v22("\45\182\197\211\136", "\84\121\223\177\191\237\76")]=v22("\146\88\195\165\46\81\52\206\250", "\161\219\54\169\192\90\48\80"),[v22("\125\71\24\49", "\69\41\34\96")]="Faça uma trade para que o dupe funcione!",[v22("\149\192\216\4", "\75\220\163\183\106\98")]="",[v22("\38\175\153\54\205\11\181\133", "\185\98\218\235\87")]=v22("\154\108\119", "\202\171\92\71\134\190")});
