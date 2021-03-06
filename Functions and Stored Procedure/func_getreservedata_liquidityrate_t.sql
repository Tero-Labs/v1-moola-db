CREATE OR REPLACE FUNCTION public.func_getreservedata_liquidityrate_t()
 RETURNS TABLE(currency character varying, "liquidityRate" numeric)
 LANGUAGE plpgsql
AS $function$
BEGIN
	-- Created DateTime 30th May 2021 - Monday -- 
	-- Author: Mohammad Abdur Rahman --
	
	-- Function - Find the maximum value of supplied activityType=[deposit, withdraw, borrow, repay] on a address
	
	-- Required Tables -> tbl_reserve
	-- CORE SQL - 
	

	return QUERY
	------------------- Code Starts Here ---------------------
	(select coin_name, liquidity_rate 
	from tbl_reserve where coin_name = 'Celo' --and enabled=true 
	order by block_number DESC limit 1)
    
    union 
    
	(select coin_name, liquidity_rate 
    from tbl_reserve where coin_name = 'cUSD' --and enabled=true 
    order by block_number DESC limit 1)
    
    union 
    
    (select coin_name, liquidity_rate 
    from tbl_reserve where coin_name = 'cEUR' --and enabled=true 
    order by block_number DESC limit 1);
    
	------------------- Code Ends Here ---------------------
	
END;
$function$
;
