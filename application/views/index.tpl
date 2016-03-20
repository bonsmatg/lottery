{include file="template_smarty/header.tpl" }

 <div class="Officia-section">
 	 <div class="container">
		 <div class="Officia-section-info">
             <div class="col-md-6 Officia-section-part-1">
                 <h3>Numbers <small>{$type}</small></h3>
                 <div class="row">
                     <form class="form-inline" action="/home/getDataByDate/{$type}" method="post">
                         <div class="form-group">
                             <label>Mode</label>
                             <select class="form-control" name="mode">
                                 <option value="b" {if $strategy.method eq 'b'}selected="selected"{/if}>BBSS</option>
                                 <option value="s" {if $strategy.method eq 's'}selected="selected"{/if}>SSBB</option>
                                 <option value="o" {if $strategy.method eq 'o'}selected="selected"{/if}>OOEE</option>
                                 <option value="e" {if $strategy.method eq 'e'}selected="selected"{/if}>EEOO</option>
                                 <option value="c" {if $strategy.method eq 'c'}selected="selected"{/if}>CCMM</option>
                                 <option value="m" {if $strategy.method eq 'm'}selected="selected"{/if}>MMCC</option>
                             </select>
                         </div>
                         <div class="form-group">
                             <label>Times</label>
                             <select class="form-control" name="times">
                                 <option value="1,2,6,15">Steady</option>
                                 <option value="1,2,6,18">Aggressive</option>
                             </select>
                         </div>
                         <div class="form-group">
                             <button type="submit" class="btn btn-default">Submit</button>
                         </div>
                     </form>
                 </div>
                 <br>
                 <div class="">
                     <a href=""><button class="btn btn-warning">Before</button></a>
                     <a href=""><button class="btn btn-info">After</button></a>
                 </div>
                 <br>
                 <table class="table table-striped table-bordered table-hover table-condensed">
					 <tr>
						 <th>NO.</th>
						 <th>Time</th>
						 <th>1st.</th>
						 <th>2nd.</th>
						 <th>3rd.</th>
						 <th>4th.</th>
						 <th>5th.</th>
					 </tr>
                     {foreach from=$data[0] item=item}
                         <tr>
                             <td>{$item.num}</td>
                             <td>{$item.time}</td>
                             <td class="{if $item.first.info.result gt 0}danger{else}info{/if}">{$item.first.num}</td>
                             <td class={if $item.second.info.result gt 0}"danger"{else}"info"{/if}>{$item.second.num}</td>
                             <td class={if $item.third.info.result gt 0}"danger"{else}"info"{/if}>{$item.third.num}</td>
                             <td class={if $item.fourth.info.result gt 0}"danger"{else}"info"{/if}>{$item.fourth.num}</td>
                             <td class={if $item.last.info.result gt 0}"danger"{else}"info"{/if}>{$item.last.num}</td>
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
                 <h3>Statistics <small>{$type}</small></h3>
             </div>
             <div class="clearfix"> </div>
 	    </div>
    </div>
</div>

{include file="template_smarty/footer.tpl" }

