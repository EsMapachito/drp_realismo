local forced = false

Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsPlayerFreeAiming(PlayerId()) then -- Apuntando?
            firstperson = Citizen.InvokeNative(0x90DA5BA5C2635416) -- Esta apuntando ya en primera persona?
            if firstperson == true and forced == false then -- ya esta en primera luego no hay que forzar a primera
                forced = false
            else
                Citizen.InvokeNative(0x90DA5BA5C2635416) -- forzar primera persona
                forced = true
            end
        else -- sin apuntar
            if forced == true then -- Esta siendo forzado?
                Citizen.InvokeNative(0x1CFB749AD4317BDE) -- forzar tercera persona
                forced = false
            end
        end
    end
end)