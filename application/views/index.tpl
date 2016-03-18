{include file="template_smarty/header.tpl" }

 <div class="Officia-section">
 	 <div class="container">
		 <div class="Officia-section-info">
             <div class="col-md-6 Officia-section-part-1">
                 <table class="table">
					 <tr>
						 <th>NO.</th>
						 <th>Time</th>
						 <th>First</th>
						 <th>Second</th>
						 <th>Third</th>
						 <th>Fourth</th>
						 <th>Last</th>
					 </tr>
                     {foreach from=$data[0] item=item}
                         <tr>
                             <td>{$item.num}</td>
                             <td>{$item.time}</td>
                             <td class={if $item.first.info.result gt 0}"danger"{else}"success"{/if}>{$item.first.num}</td>
                             <td class={if $item.second.info.result gt 0}"danger"{else}"success"{/if}>{$item.second.num}</td>
                             <td class={if $item.third.info.result gt 0}"danger"{else}"success"{/if}>{$item.third.num}</td>
                             <td class={if $item.fourth.info.result gt 0}"danger"{else}"success"{/if}>{$item.fourth.num}</td>
                             <td class={if $item.last.info.result gt 0}"danger"{else}"success"{/if}>{$item.last.num}</td>
                        </tr>
                     {/foreach}
					 <tr>
						 <td></td>
						 <td>MAX</td>
						 <td>{$data[1]['first']}</td>
						 <td>{$data[1]['second']}</td>
						 <td>{$data[1]['third']}</td>
						 <td>{$data[1]['fourth']}</td>
						 <td>{$data[1]['last']}</td>
					 </tr>
                 </table>
             </div>
             <div class="col-md-6 Officia-section-part-2">
                 <h3>Mollit Anim Odest</h3>
             </div>
             <div class="clearfix"> </div>
 	    </div>
    </div>
</div>

{include file="template_smarty/footer.tpl" }

