CREATE OR REPLACE FUNCTION public.func_getexchange_rate_celo_to_cusd_t_old(in_value numeric)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
declare
--- Precedence - usd > celo > cusd > ceuro ?
converted_exchange_base_rate numeric;
-- value_out numeric;
BEGIN
	-- Created DateTime 5th June 2021 -  - 
	-- Author: Mohammad Abdur Rahman --
	
	-- Function - 
	
	-- Required Tables -> 
	-- CORE SQL - 
	
    select cusd_exchange_rate into converted_exchange_base_rate
	from tbl_coin_exchange_rate 
	where coin_name = 'Celo' --and enabled=true
	order by block_number desc limit 1;


	return converted_exchange_base_rate * in_value;

	
END;
$function$
;
